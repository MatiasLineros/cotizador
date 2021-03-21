<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;
use App\Helpers\ChileRut;

class validarRut implements Rule
{
     /**
     * @var ChileRut $chileRUT
     */
    private $chileRUT;


    /**
     * Create a new rule instance.
     *
     * @param ChileRut $chileRUT
     *
     * @return void
     */
    public function __construct(ChileRut $chileRUT)
    {
        $this->chileRUT = $chileRUT;
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        return $this->chileRUT->check($value);
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'El rut no es válido.';
    }
}
