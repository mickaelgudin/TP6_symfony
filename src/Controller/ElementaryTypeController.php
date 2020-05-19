<?php

namespace App\Controller;

use App\Entity\ElementaryType;
use App\Form\ElementaryTypeType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

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
