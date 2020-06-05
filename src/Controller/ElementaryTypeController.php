<?php

namespace App\Controller;

use App\Entity\ElementaryType;
use App\Entity\Pokemon;
use App\Form\ElementaryTypeType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\RefPokemonRepository;
use Symfony\Component\HttpFoundation\Session\Session;

/**
 * @Route("/elementary/type")
 */
class ElementaryTypeController extends AbstractController
{
    /**
     * @Route("/", name="elementary_type_index", methods={"GET"})
     */
    public function index(): Response
    {
        $elementaryTypes = $this->getDoctrine()
            ->getRepository(ElementaryType::class)
            ->findAll();

        return $this->render('elementary_type/index.html.twig', [
            'elementary_types' => $elementaryTypes,
        ]);
    }
    
    /**
     * @Route("/do_capture", name="doCapture", methods={"GET"})
     */
    public function doCapture(RefPokemonRepository $refRepository)
    {
       $session = new Session();
       $id_user = $session->get('id_user');
       $typeArray = array('montagne', 'prairie', 'ville', 'foret', 'plage');
        if($id_user !== null && !empty($_GET['type']) && in_array($_GET['type'], $typeArray)){
            $elementaryTypesWithLieu = $this->getDoctrine()
            ->getRepository(ElementaryType::class)
            ->findBy(array($_GET['type'] => 1));
            
            //on recupere un type au hasard
            $randomTypeNumber = random_int(0, sizeof($elementaryTypesWithLieu)-1);
            $idElementaryType = $elementaryTypesWithLieu[$randomTypeNumber]->getId();
            //on recupere un pokemon au hasard ayant le type elementary 
            $pokemonsWithType = $refRepository->getPokemonRefByTypeId($idElementaryType);
            $randomTypeNumber = random_int(0, sizeof($pokemonsWithType)-1);
            
            $pokemonRefId = $pokemonsWithType[$randomTypeNumber]['id'];
            
            $pokemonCapture = new Pokemon();
            $pokemonCapture->setDresseurid(intval($id_user));
            $pokemonCapture->setPokemontypeid($pokemonRefId);
            
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($pokemonCapture);
            $entityManager->flush();
            return $this->render('elementary_type/capture.html.twig', ['message_success' => 'Felicitations ! Vous avez capture un pokemon',
                                                                        'user' => $id_user  ]);
        }
        
        return $this->render('elementary_type/capture.html.twig', ['message_success' => '',
                                                                   'user' => $id_user                                            
        ]);
    }
    
    /**
     * @Route("/capture", name="capture_index", methods={"GET"})
     */
    public function capture_index(): Response
    {
        $session = new Session();
        $id_user = $session->get('id_user');
        
        return $this->render('elementary_type/capture.html.twig', ['user' => $id_user]);
    }

    /**
     * @Route("/new", name="elementary_type_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $elementaryType = new ElementaryType();
        $form = $this->createForm(ElementaryTypeType::class, $elementaryType);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($elementaryType);
            $entityManager->flush();

            return $this->redirectToRoute('elementary_type_index');
        }

        return $this->render('elementary_type/new.html.twig', [
            'elementary_type' => $elementaryType,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="elementary_type_show", methods={"GET"})
     */
    public function show(ElementaryType $elementaryType): Response
    {
        return $this->render('elementary_type/show.html.twig', [
            'elementary_type' => $elementaryType,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="elementary_type_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, ElementaryType $elementaryType): Response
    {
        $form = $this->createForm(ElementaryTypeType::class, $elementaryType);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('elementary_type_index');
        }

        return $this->render('elementary_type/edit.html.twig', [
            'elementary_type' => $elementaryType,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="elementary_type_delete", methods={"DELETE"})
     */
    public function delete(Request $request, ElementaryType $elementaryType): Response
    {
        if ($this->isCsrfTokenValid('delete'.$elementaryType->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($elementaryType);
            $entityManager->flush();
        }

        return $this->redirectToRoute('elementary_type_index');
    }
}
