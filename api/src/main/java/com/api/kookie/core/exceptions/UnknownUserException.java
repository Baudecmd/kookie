package com.api.kookie.core.exceptions;

public class UnknownUserException extends RuntimeException {

    public UnknownUserException() {
        super("unknown_user");
    }
}
