package com.lanihuang.simplewebapp.beans;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class ProductTest {

    public Product product;

    @Before
    public void init() {
        product = new Product("000", "rice", 10);
    }

    @Test
    public void canConstructAPersonWithAName() {
        assertEquals("000", product.getCode());
        }
    }
