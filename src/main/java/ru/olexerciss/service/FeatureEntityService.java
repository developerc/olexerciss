package ru.olexerciss.service;

import ru.olexerciss.entity.FeatureEntity;

import java.util.List;

public interface FeatureEntityService {
    /**
     * method for add featureEntity
     *
     * @param featureEntity = new featureEntity for creation in DB
     * @return created featureEntity
     */
    FeatureEntity addFeatureEntity(FeatureEntity featureEntity);

    /**
     * method for receiving all featureEntities
     *
     * @return all featureEntities
     */
    List<FeatureEntity> getAllFeatureEntities();

    /**
     * method for receive specify featureEntity by id
     *
     * @param id = uniq featureEntity id
     * @return specify featureEntity by id
     */
    FeatureEntity getFeatureEntityById(long id);

    /**
     * method for taxofonList delete
     *
     * @param id = featureEntity's id for delete
     * @return removed featureEntity
     */
    FeatureEntity deleteFeatureEntity(long id);

    /**
     * method for update taxofonList
     *
     * @param featureEntity = update existing featureEntity in DB
     * @return updated featureEntity
     */
    FeatureEntity updFeatureEntity(FeatureEntity featureEntity);
}
