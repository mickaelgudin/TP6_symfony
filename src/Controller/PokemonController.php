<?php

namespace App\Controller;

use App\Entity\Pokemon;
use App\Form\PokemonType;
use App\Repository\PokemonRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\Session;

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
     * @Route("/sell", name="sell", methods={"GET"})
     */
    public function sell(Request $request): Response
    {
        $pokemon = $this->getDoctrine()
        ->getRepository(Pokemon::class)
        ->find($_GET['id']);
        
        if($pokemon->getStatus() !== 'v'){
            $pokemon->setStatus('v');
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($pokemon);
            $entityManager->flush();
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
        
        if($pokemon->getStatus() === 'v'){
            $pokemon->setStatus('');
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($pokemon);
            $entityManager->flush();
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
        $pokemons = $pkmnRepository->getMyPokemons($id_user);
        
        return $this->render('pokemon/index.html.twig', [
            'pokemon' => $pokemons,
            'user' => $id_user
        ]);
    }


    /**
     * @Route("/market", name="market", methods={"GET"})
     */
    public function displayMarket(PokemonRepository $pkmnRepository): Response
    {
        $session = new Session();
        $id_user = $session->get('id_user');
        
        $pokemonss = $pkmnRepository->getPokemonMarket();  
        return $this->render('pokemon/pokemon_market.html.twig', [
            'pokemonss' => $pokemonss,
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
     * @Route("/market/{id}", name="pokemon_buy", methods={"PUT"})
     */
    public function buy(Request $request, PokemonRepository $pkmnRepository, Pokemon $pokemon): Response
    {
        $form = $this->createForm(PokemonType::class, $pokemon);
        $form->handleRequest($request);
        //add user and check ih he has enough money
        //if()
        $pkmnRepository->updatePokemonById($pokemon->getIdp());
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
