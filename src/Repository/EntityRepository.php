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
        $sql = 'SELECT libelle as type, nb FROM ((SELECT type_1 as type, count(type_1) as nb from ref_pokemon_type GROUP BY type_1)
UNION
(SELECT type_2 as type, count(type_2) as nb from ref_pokemon_type GROUP BY type_2)) as tab LEFT JOIN ref_elementary_type on type = id WHERE nb > 0';

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

    // /**
    //  * @return PokemonType[] Returns an array of PokemonType objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?PokemonType
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
