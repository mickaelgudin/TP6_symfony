<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use \DateTime;

/**
 * Pokemon
 *
 *@ORM\Entity(repositoryClass="App\Repository\EntityRepository")
 * @ORM\Table(name="pokemon")
 * @ORM\Entity
 */
class Pokemon extends DateTime
{
    /**
     * @var int
     *
     * @ORM\Column(name="idP", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idp;

    /**
     * @var string
     *
     * @ORM\Column(name="sexe", type="string", length=30, nullable=false)
     */
    private $sexe;

    /**
     * @var int
     *
     * @ORM\Column(name="xp", type="integer", nullable=false)
     */
    private $xp=0;

    /**
     * @var int
     *
     * @ORM\Column(name="niveau", type="integer", nullable=false)
     */
    private $niveau=1;

    /**
     * @var int
     *
     * @ORM\Column(name="prix_vente", type="integer", nullable=false)
     */
    private $prixVente=500;

    /**
     * @var int
     *
     * @ORM\Column(name="pokemonTypeId", type="integer", nullable=false)
     */
    private $pokemontypeid;

    /**
     * @var int
     *
     * @ORM\Column(name="dresseurId", type="integer", nullable=false)
     */
    private $dresseurid;

    /**
     * @var string
     *
     * @ORM\Column(name="status", type="string", length=1, nullable=false)
     */
    private $status = '';

    /** 
     * @var datetime
     *    
     * @ORM\Column(name="date_action", type="datetime", nullable=true) 
     */
    private $date_action;

    /**
     * @return number
     */
    public function getIdp()
    {
        return $this->idp;
    }

    /**
     * @return string
     */
    public function getSexe()
    {
        return $this->sexe;
    }

    /**
     * @return number
     */
    public function getXp()
    {
        return $this->xp;
    }

    /**
     * @return number
     */
    public function getNiveau()
    {
        return $this->niveau;
    }

    /**
     * @return number
     */
    public function getPrixVente()
    {
        return $this->prixVente;
    }

    /**
     * @return number
     */
    public function getPokemontypeid()
    {
        return $this->pokemontypeid;
    }

    /**
     * @return number
     */
    public function getDresseurid()
    {
        return $this->dresseurid;
    }

    /**
     * @return string
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * @return DateTime
     */
    public function getDateAction()
    {
        return $this->date_action;
    }

    /**
     * @param number $idp
     */
    public function setIdp($idp)
    {
        $this->idp = $idp;
    }

    /**
     * @param string $sexe
     */
    public function setSexe($sexe)
    {
        $this->sexe = $sexe;
    }

    /**
     * @param number $xp
     */
    public function setXp($xp)
    {
        $this->xp = $xp;
    }

    /**
     * @param number $niveau
     */
    public function setNiveau($niveau)
    {
        $this->niveau = $niveau;
    }

    /**
     * @param number $prixVente
     */
    public function setPrixVente($prixVente)
    {
        $this->prixVente = $prixVente;
    }

    /**
     * @param number $pokemontypeid
     */
    public function setPokemontypeid($pokemontypeid)
    {
        $this->pokemontypeid = $pokemontypeid;
    }

    /**
     * @param number $dresseurid
     */
    public function setDresseurid($dresseurid)
    {
        $this->dresseurid = $dresseurid;
    }

    /**
     * @param string $status
     */
    public function setStatus($status)
    {
        $this->status = $status;
    }

    /**
     * 
     */
    public function setDateAction()
    {
        $this->date_action= new DateTime("now");
    }   

    public function setPremiereDateAction()
    {
        $this->date_action= new DateTime("yesterday");
    }

    /**
    * @return boolean true if pokemon rested
    */
    public function isRest(){
        if($this->date_action!=NULL){
            $date_now = new DateTime("now");
            $old_date = $this->date_action;
            if(((($old_date->diff($date_now))->h) + (($old_date->diff($date_now))->days*24))<=0){
                return false;
            }
            return true;
        }
        return true;
    }
    


}
