<?php

namespace App\Controller;

use App\Entity\Dresseur;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Form\Connexion;
use App\Form\DresseurType;
use Symfony\Component\HttpFoundation\Session\Session;

/**
 * @Route("/dresseur")
 */
class DresseurController extends AbstractController
{
    /**
     * @Route("/", name="dresseur_index", methods={"GET"})
     */
    public function index(): Response
    {
        $dresseurs = $this->getDoctrine()
            ->getRepository(Dresseur::class)
            ->findAll();

        return $this->render('dresseur/index.html.twig', [
            'dresseurs' => $dresseurs,
        ]);
    }

    /**
     * @Route("/connexion", name="dresseur_connexion", methods={"GET","POST"})
     */
    public function connexion(Request $request): Response
    {
        $dresseur = new Dresseur();
        $form = $this->createForm(Connexion::class, $dresseur);
        $form->handleRequest($request);
        
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($dresseur);
            $entityManager->flush();
            
            return $this->redirectToRoute('dresseur_index');
        }
        
        return $this->render('dresseur/connexion.html.twig', [
            'dresseur' => $dresseur,
            'form' => $form->createView(),
        ]);
    }
    
    /**
     * @Route("/new", name="dresseur_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $dresseur = new Dresseur();
        $form = $this->createForm(DresseurType::class, $dresseur);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $dresseur->setPassword(sha1($dresseur->getPassword()));
            $entityManager->persist($dresseur);
            $entityManager->flush();

            return $this->redirectToRoute('homepage');
        }

        $session = $request->getSession();
        $id_user = $session->get('id_user');
        
        return $this->render('dresseur/new.html.twig', [
            'dresseur' => $dresseur,
            'form' => $form->createView(),
            'user' => $id_user
        ]);
    }

    /**
     * @Route("/{id}", name="dresseur_show", methods={"GET"})
     */
    public function show(Dresseur $dresseur): Response
    {
        return $this->render('dresseur/show.html.twig', [
            'dresseur' => $dresseur,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="dresseur_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Dresseur $dresseur): Response
    {
        $form = $this->createForm(DresseurType::class, $dresseur);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('dresseur_index');
        }

        return $this->render('dresseur/edit.html.twig', [
            'dresseur' => $dresseur,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="dresseur_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Dresseur $dresseur): Response
    {
        if ($this->isCsrfTokenValid('delete'.$dresseur->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($dresseur);
            $entityManager->flush();
        }

        return $this->redirectToRoute('dresseur_index');
    }
}
