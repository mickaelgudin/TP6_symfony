<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * RefElementaryType
 *
 * @ORM\Table(name="ref_elementary_type")
 * @ORM\Entity
 */
class RefElementaryType
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="libelle", type="string", length=50, nullable=false)
     */
    private $libelle;


}
