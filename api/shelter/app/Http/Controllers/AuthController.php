<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Illuminate\Support\Facades\Hash;
use Illuminate\Support\facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\BaseController;
use Validator;


class AuthController extends BaseController
{
    public function signUp(Request $request)
    {
        $validator = Validator::make($request->all(), [
            "username" => "required",
            "email" => "required",
            "password" => "required",
            "confirm_password" => "required",
            "birth" => "required",
        ]);

        if ($validator->fails()) {
            return $this->sendError("Error validation", $validator->errors());
        }
        $input = $request->all();
        $input["password"] = bcrypt($input["password"]);
        $user = User::create($input);
        $success["username"] = $user->username;
        return $this->sendResponse($success, "User created successfuly");
    }

    public function signIn(Request $request)
    {
        if (Auth::attempt(["username" => $request->username, "password" => $request->password])) {
            $authUser = Auth::user();
            $success["token"] = $authUser->createToken("adoptme")->plainTextToken;
            $success["username"] = $authUser->username;
            return $this->sendResponse($success, "User signed in");
        } else {
            return $this->sendError("Sikertelen bejelentkezés", ["error" => "Hibás adatok"]);
        }
    }
    public function signOff(Request $request)
    {

        auth("sanctum")->user()->currentAccessToken()->delete();

        return response()->json('Successfully logged out');
    }
}
