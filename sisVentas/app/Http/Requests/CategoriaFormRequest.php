<?php

namespace sisVentas\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CategoriaFormRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
	//agregar la reglas de inserciones tipo, null
	//de nuestro documento html   
    public function rules()
    {
        return [
			  'nombre' => 'required|max:45',
			  'descripcion'=>'max:256',
        ];
    }
}
