<?php

namespace sisVentas;

use Illuminate\Database\Eloquent\Model;

class Categoria extends Model
{
//creamos la tabla de nuestra bd
    protected $table= 'categoria';
//indicamos el llave primaria
	 protected $primaryKey "idcategoria";

// colomnas de creacion y tiempo
	 public $timestamps = false;

// declaramos los campos que se van a guardan en la bd
	 protected $fillable = [
		 'nombre',
		 'descripcion',
		 'condicion'
	 ];
// la diferencia entre fillable los campos guardes se especifican cuanto no queremos que se almacenen en la bd.
	 protected $guarded =[

	 ];
}
