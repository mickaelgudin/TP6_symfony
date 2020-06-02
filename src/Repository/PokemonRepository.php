<?php

namespace App\Repository;

use App\Entity\Pokemon;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Pokemon|null find($id, $lockMode = null, $lockVersion = null)
 * @method Pokemon|null findOneBy(array $criteria, array $orderBy = null)
 * @method Pokemon[]    findAll()
 * @method Pokemon[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PokemonRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Pokemon::class);
    }

    public function updatePokemonById($id_value){
        $conn = $this->getEntityManager()->getConnection();
        $sql = "UPDATE pokemon SET dresseurId=2, status = '' WHERE idP=:idPkmn";
		$prep = $conn->prepare($sql);
        $prep->bindValue(':idPkmn', $id_value);
        $prep->execute();

    }

    public function getPokemonMarket(){
		$conn = $this->getEntityManager()->getConnection();
        $sql = "SELECT t1.*, t2.nom FROM pokemon t1 LEFT JOIN ref_pokemon t2 ON t1.pokemonTypeId=t2.id WHERE status='v'";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }
}
