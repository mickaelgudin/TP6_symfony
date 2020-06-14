<?php

namespace App\Controller;

use App\Entity\Pokemon;
use App\Entity\Dresseur;
use App\Form\PokemonType;
use App\Repository\PokemonRepository;
use App\Repository\DresseurRepository;
use App\Repository\RefPokemonRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\Session;
use \DateTime;

/**
 * @Route("/pokemon")
 */
class PokemonController extends AbstractController
{
    /**
     * @Route("/", name="pokemon_index", methods={"GET"})
     */
    public function index(): Response
    {
        $pokemon = $this->getDoctrine()
            ->getRepository(Pokemon::class)
            ->findAll();

        return $this->render('pokemon/index.html.twig', [
            'pokemon' => $pokemon,
        ]);
    }
    
    /**
     * @Route("/sell", name="sell", methods={"GET", "DELETE", "POST"})
     */
    public function sell(Request $request): Response
    {
        $pokemon = $this->getDoctrine()
        ->getRepository(Pokemon::class)
        ->find($_GET['id']);
        
        if($pokemon->getStatus() !== 'v'){
            $pokemon->setStatus('v');
            if(isset($_POST['price'])){
                $pokemon->setPrixVente($_POST['price']);
            }
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($pokemon);
            $entityManager->flush();
            
            $this->get('session')->getFlashBag()->add(
                'success',
                'Le pokemon a ete vendu'
            );
        } else{
            $this->get('session')->getFlashBag()->add(
                'error',
                'Le pokemon est deja en vente'
            );
        }
        
        return $this->redirectToRoute('mes_pokemons');
    }
    
    /**
     * @Route("/remove_sell", name="remove_from_sells", methods={"GET"})
     */
    public function removeSell(Request $request): Response
    {
        $pokemon = $this->getDoctrine()
        ->getRepository(Pokemon::class)
        ->find($_GET['id']);
        
        if($pokemon!=null && $pokemon->getStatus() === 'v'){
            $pokemon->setStatus('');
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($pokemon);
            $entityManager->flush();
            $this->get('session')->getFlashBag()->add(
                'success',
                'Le pokemon a ete retire des ventes'
            );
        } else{
            $this->get('session')->getFlashBag()->add(
                'error',
                'Le pokemon n\'a pas pu etre retire des ventes'
            );
        }
        
        return $this->redirectToRoute('mes_pokemons');   
    }

    /**
     * @Route("/new", name="pokemon_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $pokemon = new Pokemon();
        $form = $this->createForm(PokemonType::class, $pokemon);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($pokemon);
            $entityManager->flush();

            return $this->redirectToRoute('pokemon_index');
        }

        return $this->render('pokemon/new.html.twig', [
            'pokemon' => $pokemon,
            'form' => $form->createView(),
        ]);
    }
    
    /**
     * @Route("/mes_pokemons", name="mes_pokemons", methods={"GET"})
     */
    public function getMyPokemons(Request $request, PokemonRepository $pkmnRepository): Response
    {
        $session = new Session();
        $id_user = $session->get('id_user');
        if($id_user == null){
            return $this->redirectToRoute('homepage');
        }
        $this->updatePokemonsStatus($pkmnRepository, $id_user);
        
        $pokemons = $pkmnRepository->getMyPokemons($id_user);
        
        return $this->render('pokemon/index.html.twig', [
            'pokemon' => $pokemons,
            'user' => $id_user
        ]);
    }
    
    /**
     * update the status of all pokemons
     * that are hunting(status='h') or training(status='e') 
     * if their date was at least an hour ago 
     * 
     * @param PokemonRepository $pkmnRepository
     * @param string $id_user
     */
    public function updatePokemonsStatus(PokemonRepository $pkmnRepository, $id_user){
        $pokemons = $pkmnRepository->getMyPokemons($id_user);
        $idsPokemonsToUpdate = '';
        for($i=0; $i < sizeof($pokemons); $i++){
            if(is_null($pokemons[$i]['date_action']) ){
                continue;
            }
            
            $datePokemon = date_create_from_format('Y-m-d H:i:s', $pokemons[$i]['date_action']);
            date_add($datePokemon, date_interval_create_from_date_string('1 hour'));
            if($datePokemon < date_create_from_format('Y-m-d H:i:s', date('Y-m-d H:i:s')) ){
                $idsPokemonsToUpdate .= $pokemons[$i]['idP'].',';
            }
        }
        if($idsPokemonsToUpdate !== ''){
            $idsPokemonsToUpdate = substr_replace($idsPokemonsToUpdate, '', -1);
            $pkmnRepository->updatePokemonStatus($idsPokemonsToUpdate);
        }
    }
    /**
     * @Route("/market", name="market", methods={"GET"})
     */
    public function displayMarket(PokemonRepository $pkmnRepository, DresseurRepository $dresseurRepository): Response
    {
        $session = new Session();
        $id_user = $session->get('id_user');
        if($id_user == null){
            return $this->redirectToRoute('homepage');
        }
        $dresseur_compte = $dresseurRepository->findOneBy(array('id' => $id_user));
        
        $pokemonss = $pkmnRepository->getPokemonMarket($id_user);  
        return $this->render('pokemon/pokemon_market.html.twig', [
            'pokemonss' => $pokemonss,
            'dresseur' => $dresseur_compte,
            'user' => $id_user
        ]);
    }   

    /**
     * @Route("/choose_pokemon", name="capture", methods={"GET"})
     */
    public function choosePokemonToGoCapture(Request $request, PokemonRepository $pkmnRepository ): Response
    {
        $session = new Session();
        $id_user = $session->get('id_user');
        if($id_user == null){
            return $this->redirectToRoute('homepage');
        }
        $this->updatePokemonsStatus($pkmnRepository, $id_user);
        $pokemons = $pkmnRepository->getMyPokemons($id_user);
        return $this->render('pokemon/choix_pokemon_capture.html.twig', [
            'pokemons' => $pokemons,
            'user' => $id_user
        ]);
    }

    /**
     * @Route("/{id_pokemon}", name="pokemon_show", methods={"GET"})
     */
    public function show(Pokemon $pokemon): Response
    {
        return $this->render('pokemon/show.html.twig', [
            'pokemon' => $pokemon,
        ]);
    } 



    /**
     * @Route("/{id_pokemon}/edit", name="pokemon_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Pokemon $pokemon): Response
    {
        $form = $this->createForm(PokemonType::class, $pokemon);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('pokemon_index');
        }

        return $this->render('pokemon/edit.html.twig', [
            'pokemon' => $pokemon,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/choose_pokemon/{id}", name="display_environments", methods={"GET"})
     */
        
    public function chooseEnvironment(Request $request, Pokemon $pokemon): Response
    {
        $id_user=$request->getSession()->get('id_user');
        if($id_user == null){
            return $this->redirectToRoute('homepage');
        }
        
        return $this->render('elementary_type/capture.html.twig', [
            'pokemon' => $pokemon,
            'user' => $id_user
        ]);
    }

    /**
     * @Route("/training/{id}", name="pokemon_training", methods={"GET"})
     */
    public function training(Request $request, Pokemon $pokemon, RefPokemonRepository $refPkmnRep) : Response
    {
        if($pokemon->getDateAction()==NULL){
            $pokemon->setPremiereDateAction();
        }

        if($pokemon->isRest()){
            $espece_pkmn=$refPkmnRep->getPokemonXpCurve($pokemon->getPokemontypeid())[0]['type_courbe_niveau'];
            $pokemon->setStatus('e');
            $exp_gain = random_int(10, 30);
            $pokemon->setXp($pokemon->getXp()+$exp_gain);
            $n=$pokemon->getNiveau()-1;
            $calcul=0;
            do{
                $n++;
                if($espece_pkmn=="R"){
                    $calcul=0.8*pow($n,3);
                }
                else if($espece_pkmn=="M"){
                    $calcul=pow($n,3);
                }
                else if($espece_pkmn=="P"){
                    $calcul=((1.2*pow($n,3))-(15*pow($n,2))+(100*$n)-140);
                }
                else if($espece_pkmn=="L"){
                    $calcul=1.25*pow($n,3);
                }

            }while($pokemon->getXp()> $calcul);
                
            
            $pokemon->setNiveau($n-1);
            $pokemon->setDateAction();
            
            $this->get('session')->getFlashBag()->add(
                'success',
                'Le pokemon est maintenant en entrainement'
                );
            
            $this->getDoctrine()->getManager()->flush();

        }
        return $this->redirectToRoute('mes_pokemons');
    }

    /**
     * @Route("/market/{id}", name="pokemon_buy", methods={"GET"})
     */
    public function buy(Request $request, PokemonRepository $pkmnRepository, Pokemon $pokemon): Response
    {
        
        $id_user=$request->getSession()->get('id_user');

        $form = $this->createForm(PokemonType::class, $pokemon);
        $form->handleRequest($request);
        $dresseur_buy=$this->getDoctrine()->getRepository(Dresseur::class)
        ->findOneby(array('id'=>$id_user));

        $dresseur_seller=$this->getDoctrine()->getRepository(Dresseur::class)
        ->findOneby(array('id'=>$pokemon->getDresseurid()));

        if($dresseur_buy->getPieces()>=$pokemon->getPrixVente()){
            $pokemon->setDresseurid($id_user);
            $pokemon->setStatus('');
            $dresseur_buy->setPieces($dresseur_buy->getPieces()-$pokemon->getPrixVente());
            $dresseur_seller->setPieces($dresseur_seller->getPieces()+$pokemon->getPrixVente());

            $this->getDoctrine()->getManager()->flush();
        }

        return $this->redirectToRoute('market');
    }

    
    /**
     * @Route("/{id_pokemon}", name="pokemon_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Pokemon $pokemon): Response
    {
        if ($this->isCsrfTokenValid('delete'.$pokemon->getId_pokemon(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($pokemon);
            $entityManager->flush();
        }

        return $this->redirectToRoute('pokemon_index');
    }
}
