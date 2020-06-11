<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    /**
     *Указывает на то, принудительно ли выполняется удаление модели
     */
    use SoftDeletes;

    /**
     *Добавление дополнительного столбца, для просмотра удаленных товаров
     */
    protected $dates = ['deleted_at'];

    /**
     *Связь с категориями
     */
    public function categorie()
    {
        return $this->belongsTo('App\Categorie');
    }

    /**
     *Связь с заказами
     */
    public function orderPositions()
    {
        return $this->hasMany('App\OrderPosition');
    }
}
