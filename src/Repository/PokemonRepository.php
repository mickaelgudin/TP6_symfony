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

    /**
     * get array of pokemons that
     * are for sell and who does not
     * belong to the connected trainer(dresseur)
     * 
     * @param int $dresseurId
     * @return mixed[]
     */
    public function getPokemonMarket($dresseurId){
		$conn = $this->getEntityManager()->getConnection();
        $sql = "SELECT t1.*, t2.nom FROM pokemon t1 LEFT JOIN ref_pokemon t2 ON t1.pokemonTypeId=t2.id WHERE status='v' AND dresseurId<>".$dresseurId;
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }
    
    /**
     * getting array of pokemons
     * that belong to the connected
     * trainer(dresseur)
     * 
     * @param int $dresseurId
     * @return array
     */
    public function getMyPokemons($dresseurId){
        $conn = $this->getEntityManager()->getConnection();
        $sql = "SELECT t1.*, t2.nom FROM pokemon t1 LEFT JOIN ref_pokemon t2 ON t1.pokemonTypeId=t2.id WHERE dresseurId=".$dresseurId;
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }
    
    /**
     * updating status of pokemons
     * that aren't for sale, in order
     * to respect the time limit(1hour after)
     * 
     * @param string $in
     */
    public function updatePokemonStatus($in){
        $conn = $this->getEntityManager()->getConnection();
        $sql = "UPDATE pokemon set status='' WHERE idP IN(".$in.") AND status<>'v' ";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
    }
    

}
