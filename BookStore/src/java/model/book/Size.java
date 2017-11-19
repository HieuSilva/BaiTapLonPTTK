/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.book;

import java.io.Serializable;

/**
 *
 * @author Dell
 */
public class Size implements Serializable {

    private int id;
    private float width;
    private float height;
    private float length;
    private float mass;

    public Size() {
    }

    public Size(int id, float width, float height, float length, float mass) {
        this.id = id;
        this.width = width;
        this.height = height;
        this.length = length;
        this.mass = mass;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getWidth() {
        return width;
    }

    public void setWidth(float width) {
        this.width = width;
    }

    public float getHeight() {
        return height;
    }

    public void setHeight(float height) {
        this.height = height;
    }

    public float getLength() {
        return length;
    }

    public void setLength(float length) {
        this.length = length;
    }

    public float getMass() {
        return mass;
    }

    public void setMass(float mass) {
        this.mass = mass;
    }

}
