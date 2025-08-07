<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Webkul\Category\Repositories\CategoryRepository;
 

class CategoryController extends Controller
{
    protected $categoryRepository;

    public function __construct(CategoryRepository $categoryRepository)
    {
        $this->categoryRepository = $categoryRepository;
    }

    public function index()
    {
        $categories = $this->categoryRepository->all();
        //return response()->json($categories);
		
		$filteredcategories = $categories->map(function ($categories) {
        return [
            'name' => $categories->name,
            'id' => $categories->id,
            'url' => $categories->url,
			'parent_id' => $categories->parent_id,
            'parent_name' => $categories->parent ? $categories->parent->name : null,
            
        ];
    });

    return response()->json($filteredcategories);
    }
}
