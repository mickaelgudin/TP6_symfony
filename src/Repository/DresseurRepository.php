<?php

namespace App\Repository;

use App\Entity\Dresseur;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Dresseur|null find($id, $lockMode = null, $lockVersion = null)
 * @method Dresseur|null findOneBy(array $criteria, array $orderBy = null)
 * @method Dresseur[]    findAll()
 * @method Dresseur[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DresseurRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Dresseur::class);
    }
}