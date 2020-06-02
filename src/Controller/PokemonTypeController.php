<?php

namespace App\Controller;

use App\Entity\PokemonType;
use App\Form\PokemonTypeType;
use App\Repository\EntityRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/pokemon_type")
 */
class PokemonTypeController extends AbstractController
{
    /**
     * @Route("/", name="pokemon_type_index", methods={"GET"})
     */
    public function index(EntityRepository $entityRepository): Response
    {
        //var_dump($entityRepository->findAll()[0]->getType1());
/*        $pokemon_types = $entityRepository->findAll();
        $list1_pkm = array();
        $list2_pkm = array();

        foreach ($pokemon_types as $value) {
            var_dump(($entityRepository->findBy( array('id'=>$value->getType1())))[0]->getLibelle());
            array_push($list1_pkm,($entityRepository->findBy( array('id'=>$value->getType1()))->getLibelle()));
            //$list1_pkm->
            array_push($list2_pkm,($entityRepository->findBy( array('id'=>$value->getType2()))->getLibelle())); 
        //$list2_pkm->
        }
         return $this->render('pokemon_type/index.html.twig', [
            'pokemon_types' => $entityRepository->getPokemonType(),
            'list1_pkm' => $list1_pkm,
            'list2_pkm' => $list2_pkm, 
        ]);*/

        $pokemon_types = $entityRepository->getPokemonType();
        return $this->render('pokemon_type/index.html.twig', [
            'pokemon_types' => $entityRepository->getPokemonType(),
        ]);
    }

    /**
     * @Route("/new", name="pokemon_type_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $pokemonType = new PokemonType();
        $form = $this->createForm(PokemonTypeType::class, $pokemonType);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($pokemonType);
            $entityManager->flush();

            return $this->redirectToRoute('pokemon_type_index');
        }

        return $this->render('pokemon_type/new.html.twig', [
            'pokemon_type' => $pokemonType,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="pokemon_type_show", methods={"GET"})
     */
    public function show(EntityRepository $entityRepository, PokemonType $pokemonType): Response
    {
        return $this->render('pokemon_type/show.html.twig', [
            'pokemon_type' =>  $entityRepository->getPokemonTypeById($pokemonType->getId())[0],
        ]);
    }

    /**
     * @Route("/{id}/edit", name="pokemon_type_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, PokemonType $pokemonType): Response
    {
        $form = $this->createForm(PokemonTypeType::class, $pokemonType);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('pokemon_type_index');
        }

        return $this->render('pokemon_type/edit.html.twig', [
            'pokemon_type' => $pokemonType,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="pokemon_type_delete", methods={"DELETE"})
     */
    public function delete(Request $request, PokemonType $pokemonType): Response
    {
        if ($this->isCsrfTokenValid('delete'.$pokemonType->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($pokemonType);
            $entityManager->flush();
        }

        return $this->redirectToRoute('pokemon_type_index');
    }
}
