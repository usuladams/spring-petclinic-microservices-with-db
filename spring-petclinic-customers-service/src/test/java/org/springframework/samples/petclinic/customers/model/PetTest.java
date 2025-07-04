package org.springframework.samples.petclinic.customers.model;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Date;

import org.junit.jupiter.api.Test;

public class PetTest {

    @Test
    public void testGetName() {
        Pet pet = new Pet();
        pet.setName("Fluffy");
        assertEquals("Fluffy", pet.getName());
    }

    @Test
    public void testGetOwner() {
        Pet pet = new Pet();
        Owner owner = new Owner();
        owner.setFirstName("Call");
        owner.setLastName("Doe");

        pet.setOwner(owner);
        assertEquals("Call", pet.getOwner().getFirstName());
        assertEquals("Doe", pet.getOwner().getLastName());
    }

    @Test
    public void testBirthDate() {
        Pet pet = new Pet();
        Date bd = new Date();
        pet.setBirthDate(bd);
        assertEquals(bd, pet.getBirthDate());
    }

    @Test
    public void testGetId() {
        Pet pet = new Pet();
        pet.setId(42);
        assertEquals(42, pet.getId());
    }

    @Test
    public void testGetType() {
        Pet pet = new Pet();
        PetType type = new PetType();
        type.setName("Hamster");

        pet.setType(type);
        assertEquals("Hamster", pet.getType().getName());
    }

    @Test
    public void testEqualsAndHashCode() {
        Pet pet1 = new Pet();
        Pet pet2 = new Pet();
        Date birthDate = new Date();

        PetType type = new PetType();
        type.setName("Cat");

        Owner owner = new Owner();
        owner.setFirstName("Alice");
        owner.setLastName("Smith");

        pet1.setId(1);
        pet1.setName("Whiskers");
        pet1.setBirthDate(birthDate);
        pet1.setType(type);
        pet1.setOwner(owner);

        pet2.setId(1);
        pet2.setName("Whiskers");
        pet2.setBirthDate(birthDate);
        pet2.setType(type);
        pet2.setOwner(owner);

        assertEquals(pet1, pet2);
        assertEquals(pet1.hashCode(), pet2.hashCode());
    }

    @Test
    public void testToStringDoesNotThrow() {
        Pet pet = new Pet();
        pet.setId(1);
        pet.setName("Max");
        pet.setBirthDate(new Date());

        PetType type = new PetType();
        type.setName("Dog");

        Owner owner = new Owner();
        owner.setFirstName("John");
        owner.setLastName("Smith");

        pet.setType(type);
        pet.setOwner(owner);

        assertDoesNotThrow(() -> {
            String output = pet.toString();
            assertTrue(output.contains("Max"));
            assertTrue(output.contains("John"));
            assertTrue(output.contains("Dog"));
        });
    }
}
