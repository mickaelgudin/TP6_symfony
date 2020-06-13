<?php

namespace App\Repository;

use App\Entity\PokemonType;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method PokemonType|null find($id, $lockMode = null, $lockVersion = null)
 * @method PokemonType|null findOneBy(array $criteria, array $orderBy = null)
 * @method PokemonType[]    findAll()
 * @method PokemonType[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class EntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, PokemonType::class);
    }

    /**
     * @return mixed[]
     * @throws \Doctrine\DBAL\DBALException
     */
    public function getStatsByType(){
        $conn = $this->getEntityManager()->getConnection();
        $sql = 'SELECT libelle as type, count(types) as nb FROM (
                    (SELECT type_1 as types, id as id_ref from ref_pokemon WHERE type_1 > 0)
                    UNION
                    (SELECT type_2 as types, id as id_ref from ref_pokemon WHERE type_2 > 0)) as tab
                LEFT JOIN ref_elementary_type on types = id GROUP BY(types)';

        $stmt = $conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    /**
     * @return PokemonType[] Returns an array of PokemonType objects
     */
    public function getNbEvo(){
        $t = $this->findBy(["evolution"=> true]);
        return sizeof($t);
    }

    public function getPokemonType(){
        $conn = $this->getEntityManager()->getConnection();
        $sql = 'SELECT id,nom,lib1,lib2,evolution,starter,type_courbe_niveau FROM
                (SELECT t1.id as id1, t1.*, libelle as lib1 FROM ref_pokemon t1
                LEFT JOIN ref_elementary_type t2 on type_1 = t2.id) tb1
                LEFT JOIN
                (SELECT t2.id as id2, libelle as lib2 FROM ref_pokemon t2
                LEFT JOIN ref_elementary_type t3 on type_2 = t3.id) tb2
                ON tb1.id1=tb2.id2';
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();       
    }

    public function getPokemonTypeById($id_value){
        $conn = $this->getEntityManager()->getConnection();
        $sql = 'SELECT id,nom,lib1,lib2,evolution,starter,type_courbe_niveau FROM
                (SELECT t1.id as id1, t1.*, libelle as lib1 FROM ref_pokemon t1 
                LEFT JOIN ref_elementary_type t2 on type_1 = t2.id WHERE t1.id=:idPkmn) tb1
                LEFT JOIN
                (SELECT t2.id as id2, libelle as lib2 FROM ref_pokemon t2 
                LEFT JOIN ref_elementary_type t3 on type_2 = t3.id WHERE t2.id=:idPkmn) tb2
                ON tb1.id1=tb2.id2;';
        $prep = $conn->prepare($sql);
        $prep->bindValue(':idPkmn', $id_value);
        $prep->execute();
        
        return $prep->fetchAll();

    }

}
