<?php

namespace App\Form;

use App\Entity\PokemonType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PokemonTypeType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('nom')
            ->add('evolution')
            ->add('starter')
            ->add('typeCourbeNiveau')
            ->add('type1')
            ->add('type2')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => PokemonType::class,
        ]);
    }
}
