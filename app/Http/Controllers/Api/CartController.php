<?php

namespace App\Http\Controllers\Api;
use Webkul\Checkout\Repositories\CartRepository;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CartController extends Controller
{
    protected $cartRepository;
    public function __construct(CartRepository $cartRepository)
    {
        $this->cartRepository = $cartRepository;
    }
    public function add(Request $request)
    {
        $data = $request->only(['product_id', 'quantity']);

        try {
            $productId = $request->input('product_id');
            $quantity = $request->input('quantity', 1);

            $cart = $this->cartRepository->addProduct($productId, ['quantity' => $quantity]);

            return response()->json([
                'message' => 'Product added to cart successfully.',
                'cart' => $cart
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Failed to add to cart',
                'details' => $e->getMessage()
            ], 500);
        }
    }
}
