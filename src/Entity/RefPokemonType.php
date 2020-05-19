<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * RefPokemonType
 *
 * @ORM\Table(name="ref_pokemon_type", indexes={@ORM\Index(name="IDX_5483EF999C6D843C", columns={"type_1"}), @ORM\Index(name="IDX_5483EF99564D586", columns={"type_2"})})
 * @ORM\Entity
 */
class RefPokemonType
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
     * @var int|null
     *
     * @ORM\Column(name="type_2", type="integer", nullable=true, options={"default"="NULL"})
     */
    private $type2 = 'NULL';

    /**
     * @var string
     *
     * @ORM\Column(name="nom", type="string", length=255, nullable=false)
     */
    private $nom;

    /**
     * @var bool
     *
     * @ORM\Column(name="evolution", type="boolean", nullable=false)
     */
    private $evolution;

    /**
     * @var bool
     *
     * @ORM\Column(name="starter", type="boolean", nullable=false)
     */
    private $starter;

    /**
     * @var string
     *
     * @ORM\Column(name="type_courbe_niveau", type="string", length=1, nullable=false, options={"fixed"=true})
     */
    private $typeCourbeNiveau;

    /**
     * @var \RefElementaryType
     *
     * @ORM\ManyToOne(targetEntity="RefElementaryType")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="type_1", referencedColumnName="id")
     * })
     */
    private $type1;


}
