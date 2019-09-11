package br.com.adotepets.application.resources;

import br.com.adotepets.domain.model.entities.PersistentEntity;
import br.com.adotepets.domain.model.exception.ResourceNotFoundException;
import br.com.adotepets.domain.repositories.sistema.FileRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.swing.*;
import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

public class AbstractResource<T extends PersistentEntity> {

    protected JpaRepository<T, Long> repository;

    /**
     *
     * @param repository
     */
    public AbstractResource(JpaRepository<T, Long> repository) {
        this.repository = repository;
    }

    /**
     * @return
     */
    @CrossOrigin(origins = "*")
    @GetMapping
    public Page<T> findAll() {
        int page = 0;
        int size = 12;
        PageRequest pageRequest = PageRequest.of(
                page,
                size,
                Sort.Direction.ASC,
                "created_on");
        return new PageImpl<>(
                repository.findAll(),
                pageRequest, size);
    }

    /**
     * @param value
     * @return
     */
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public T create(@RequestBody @Valid T value) {
        return this.repository.save(value);
    }

    /**
     *
     * @param values
     * @return
     */
    @PostMapping("/lista")
    @ResponseStatus(HttpStatus.CREATED)
    public List<T> create(@RequestBody @Valid List<T> values) {
        return this.repository.saveAll(values);
    }

    /**
     * @param id
     */
    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable("id") Long id) {
        this.repository.deleteById(id);
    }

    /**
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public T findById(@PathVariable("id") Long id) {
        return this.repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Recurso com id {0} nao encontrado", id));
    }
}
