package com.api.kookie.core.exceptions;

public class WrongPasswordException extends RuntimeException {

    public WrongPasswordException() {
        super("wrong_password");
    }
}
