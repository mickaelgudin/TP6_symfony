<?php

namespace App\Repository;

use App\Entity\PokemonType;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

class RefPokemonRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, PokemonType::class);
    }
    
    public function getPokemonRefByTypeId($type){
        $conn = $this->getEntityManager()->getConnection();
        $sql = "SELECT id FROM ref_pokemon WHERE type_1=$type OR type_2=$type";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }
}
