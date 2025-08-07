<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Webkul\Product\Repositories\ProductRepository;

class ProductController extends Controller
{
     protected $productRepository;

    public function __construct(ProductRepository $productRepository)
    {
        $this->productRepository = $productRepository;
    }

    public function index()
    {
        $products = $this->productRepository->all();
       
	    $filteredProducts = $products->map(function ($product) {
        return [
            'name' => $product->name,
            'price' => $product->price,
            'short_description' => $product->short_description,
            'categories' => $product->categories->pluck('name'), // Or category if it's singular
        ];
    });

    return response()->json($filteredProducts);
    }
}
