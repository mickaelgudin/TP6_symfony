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
    
    /**
     * get array of pokemon with given type
     * @param string $type
     * @return array
     */
    public function getPokemonRefByTypeId($type){
        $conn = $this->getEntityManager()->getConnection();
        $sql = "SELECT id FROM ref_pokemon WHERE type_1=$type OR type_2=$type";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    /**
     * get curve of a species
     * with given id
     * 
     * @param int $id_species
     * @return array
     */
    public function getPokemonXpCurve($id_species){
        $conn = $this->getEntityManager()->getConnection();
        $sql = "SELECT type_courbe_niveau FROM ref_pokemon WHERE id=".$id_species;
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }
}
