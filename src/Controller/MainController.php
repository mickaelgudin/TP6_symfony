<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\EntityRepository;

class MainController extends AbstractController
{
    /**
     * @Route("/", name="homepage")
     */
    public function index( EntityRepository $entityRepository)
    {
        $pokemons = $entityRepository->findAll();
        $nb = sizeof($pokemons);
        $nbEvo = $entityRepository->getNbEvo();
        $stats = $entityRepository->getStatsByType();
        $session = new Session();
        $id_user = $session->get('id_user');
        
        return $this->render('main/index.html.twig', [
            'pokemons' => $pokemons,
            'nb' => $nb,
            'stats' => $stats,
            'nbEvo' => $nbEvo,
            'user' => $id_user
        ]);
    }
}
