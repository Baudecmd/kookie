package com.api.kookie.security;
<<<<<<< HEAD
=======

>>>>>>> origin/api
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.interfaces.DecodedJWT;
<<<<<<< HEAD
import java.io.UnsupportedEncodingException;
=======
>>>>>>> origin/api

public class JwtUtils {
    private final static String secret = "fj32Jfv02Mq33g0dqszaf8ioDkw";

<<<<<<< HEAD
    public static String createToken(int id)
    {
=======
    public static String createToken(int id) {
>>>>>>> origin/api
        try {
            return JWT.create()
                    .withIssuer("auth0")
                    .withClaim("id", id)
                    .sign(Algorithm.HMAC256(secret));
<<<<<<< HEAD
        } catch (JWTCreationException exception){
=======
        } catch (JWTCreationException exception) {
>>>>>>> origin/api
            throw new RuntimeException("You need to enable Algorithm.HMAC256");
        }
    }

<<<<<<< HEAD
    public static int getEmailInToken(String token) throws JWTDecodeException
    {
            JWTVerifier verifier = JWT.require(Algorithm.HMAC256(secret))
                    .withIssuer("auth0")
                    .build();
            DecodedJWT jwt = verifier.verify(token);
            return jwt.getClaim("id").asInt();
=======
    public static int getIdFromToken(String token) throws JWTDecodeException {
        JWTVerifier verifier = JWT.require(Algorithm.HMAC256(secret))
                .withIssuer("auth0")
                .build();
        DecodedJWT jwt = verifier.verify(token);
        return jwt.getClaim("id").asInt();
>>>>>>> origin/api

    }
}