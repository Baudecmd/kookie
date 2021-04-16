package com.api.kookie.core.exceptions;

public class UsernameUnavailableException extends RuntimeException {

    public UsernameUnavailableException() {
        super("username_unavailable");
    }
}
