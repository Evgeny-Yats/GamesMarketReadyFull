<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductsFilter extends Model
{
    protected $builder;
    protected $request;

    public function __construct($builder, $request)
    {
        $this->builder = $builder;
        $this->request = $request;
    }

    public function apply()
    {

        foreach ($this->filters() as $filter => $value) {
            if (method_exists($this, $filter)) {
                $this->$filter($value);
            }
        }

        return $this->builder;
    }

    public function name($value)
    {
        $this->builder->where('name', 'like', "%$value%");
    }


    public function price_from($value)
    {
        if (! $value) return;
        $this->builder->where('price', '>=', $value);


    }

    public function price_to($value)
    {
        if (! $value) return;
        $this->builder->where('price', '<=', $value);


    }

    public function range_price($value)
    {
        if (! $value) return;
        $this->builder->where('price', '>=', $value);


    }


    public function filters()
    {
        return $this->request->all();
    }
}
