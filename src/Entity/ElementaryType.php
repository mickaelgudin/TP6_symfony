<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="ref_elementary_type")
 */
class ElementaryType
{
    /**
     * @ORM\Column(type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $libelle;
    
    /**
     * @var bool
     *
     * @ORM\Column(name="montagne", type="boolean", nullable=false)
     */
    private $montagne = '0';
    
    /**
     * @var bool
     *
     * @ORM\Column(name="prairie", type="boolean", nullable=false)
     */
    private $prairie = '0';
    
    /**
     * @var bool
     *
     * @ORM\Column(name="ville", type="boolean", nullable=false)
     */
    private $ville = '0';
    
    /**
     * @var bool
     *
     * @ORM\Column(name="foret", type="boolean", nullable=false)
     */
    private $foret = '0';
    
    /**
     * @var bool
     *
     * @ORM\Column(name="plage", type="boolean", nullable=false)
     */
    private $plage = '0';

    /**
     * @return boolean
     */
    public function isMontagne()
    {
        return $this->montagne;
    }

    /**
     * @return boolean
     */
    public function isPrairie()
    {
        return $this->prairie;
    }

    /**
     * @return boolean
     */
    public function isVille()
    {
        return $this->ville;
    }

    /**
     * @return boolean
     */
    public function isForet()
    {
        return $this->foret;
    }

    /**
     * @return boolean
     */
    public function isPlage()
    {
        return $this->plage;
    }

    /**
     * @param boolean $montagne
     */
    public function setMontagne($montagne)
    {
        $this->montagne = $montagne;
    }

    /**
     * @param boolean $prairie
     */
    public function setPrairie($prairie)
    {
        $this->prairie = $prairie;
    }

    /**
     * @param boolean $ville
     */
    public function setVille($ville)
    {
        $this->ville = $ville;
    }

    /**
     * @param boolean $foret
     */
    public function setForet($foret)
    {
        $this->foret = $foret;
    }

    /**
     * @param boolean $plage
     */
    public function setPlage($plage)
    {
        $this->plage = $plage;
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return mixed
     */
    public function getLibelle()
    {
        return $this->libelle;
    }

    /**
     * @param mixed $libelle
     */
    public function setLibelle($libelle)
    {
        $this->libelle = $libelle;
    }


    public function __toString()
    {
        return $this->libelle;
    }

}