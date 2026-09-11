package com.example.trace;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

class HealthControllerTest {
    @Test
    void healthDescribesPostgresqlStorage() {
        assertThat(new HealthController().health())
            .containsEntry("status", "ok")
            .containsEntry("storage", "postgresql");
    }
}
