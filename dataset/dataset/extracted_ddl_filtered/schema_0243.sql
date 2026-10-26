-- Source: https://github.com/chaserchap/PointCloudWiresPolesClassifier/blob/018b447f0764777cd40c0fadbe9746238d130de6/envs/share/proj/sql/proj_db_table_defs.sql?raw=true
-- Tables detected: 30 | FK/REFERENCES mentions: 133

CREATE TABLE metadata(
    key TEXT NOT NULL PRIMARY KEY CHECK (length(key) >= 1),
    value TEXT NOT NULL
);

CREATE TABLE unit_of_measure(
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    name TEXT NOT NULL CHECK (length(name) >= 2),
    type TEXT NOT NULL CHECK (type IN ('length', 'angle', 'scale', 'time')),
    conv_factor FLOAT,
    deprecated BOOLEAN NOT NULL CHECK (deprecated IN (0, 1)),
    CONSTRAINT pk_unit_of_measure PRIMARY KEY (auth_name, code)
);

CREATE TABLE celestial_body (
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    name TEXT NOT NULL CHECK (length(name) >= 2),
    semi_major_axis FLOAT NOT NULL CHECK (semi_major_axis > 0), -- approximate (in metre)
    CONSTRAINT pk_celestial_body PRIMARY KEY (auth_name, code)
);

CREATE TABLE ellipsoid (
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    name TEXT NOT NULL CHECK (length(name) >= 2),
    description TEXT,
    celestial_body_auth_name TEXT NOT NULL,
    celestial_body_code TEXT NOT NULL,
    semi_major_axis FLOAT NOT NULL CHECK (semi_major_axis > 0),
    uom_auth_name TEXT NOT NULL,
    uom_code TEXT NOT NULL,
    inv_flattening FLOAT CHECK (inv_flattening = 0 OR inv_flattening >= 1.0),
    semi_minor_axis FLOAT CHECK (semi_minor_axis > 0 AND semi_minor_axis <= semi_major_axis),
    deprecated BOOLEAN NOT NULL CHECK (deprecated IN (0, 1)),
    CONSTRAINT pk_ellipsoid PRIMARY KEY (auth_name, code),
    CONSTRAINT fk_ellipsoid_celestial_body FOREIGN KEY (celestial_body_auth_name, celestial_body_code) REFERENCES celestial_body(auth_name, code),
    CONSTRAINT fk_ellipsoid_unit_of_measure FOREIGN KEY (uom_auth_name, uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT check_ellipsoid_inv_flattening_semi_minor_mutually_exclusive CHECK ((inv_flattening IS NULL AND semi_minor_axis IS NOT NULL) OR (inv_flattening IS NOT NULL AND semi_minor_axis IS NULL))
);

CREATE TABLE area(
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    name TEXT NOT NULL CHECK (length(name) >= 2),
    description TEXT NOT NULL,
    south_lat FLOAT CHECK (south_lat BETWEEN -90 AND 90),
    north_lat FLOAT CHECK (north_lat BETWEEN -90 AND 90),
    west_lon FLOAT CHECK (west_lon BETWEEN -180 AND 180),
    east_lon FLOAT CHECK (east_lon BETWEEN -180 AND 180),
    deprecated BOOLEAN NOT NULL CHECK (deprecated IN (0, 1)),
    CONSTRAINT pk_area PRIMARY KEY (auth_name, code),
    CONSTRAINT check_area_lat CHECK (south_lat <= north_lat)
);

CREATE TABLE prime_meridian(
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    name TEXT NOT NULL CHECK (length(name) >= 2),
    longitude FLOAT NOT NULL CHECK (longitude BETWEEN -180 AND 180),
    uom_auth_name TEXT NOT NULL,
    uom_code TEXT NOT NULL,
    deprecated BOOLEAN NOT NULL CHECK (deprecated IN (0, 1)),
    CONSTRAINT pk_prime_meridian PRIMARY KEY (auth_name, code),
    CONSTRAINT fk_prime_meridian_unit_of_measure FOREIGN KEY (uom_auth_name, uom_code) REFERENCES unit_of_measure(auth_name, code)
);

CREATE TABLE geodetic_datum (
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    name TEXT NOT NULL CHECK (length(name) >= 2),
    description TEXT,
    scope TEXT,
    ellipsoid_auth_name TEXT NOT NULL,
    ellipsoid_code TEXT NOT NULL,
    prime_meridian_auth_name TEXT NOT NULL,
    prime_meridian_code TEXT NOT NULL,
    area_of_use_auth_name TEXT NOT NULL,
    area_of_use_code TEXT NOT NULL,
    publication_date TEXT, --- YYYY-MM-DD format
    deprecated BOOLEAN NOT NULL CHECK (deprecated IN (0, 1)),
    CONSTRAINT pk_geodetic_datum PRIMARY KEY (auth_name, code),
    CONSTRAINT fk_geodetic_datum_ellipsoid FOREIGN KEY (ellipsoid_auth_name, ellipsoid_code) REFERENCES ellipsoid(auth_name, code),
    CONSTRAINT fk_geodetic_datum_prime_meridian FOREIGN KEY (prime_meridian_auth_name, prime_meridian_code) REFERENCES prime_meridian(auth_name, code),
    CONSTRAINT fk_geodetic_datum_area FOREIGN KEY (area_of_use_auth_name, area_of_use_code) REFERENCES area(auth_name, code)
);

CREATE TABLE vertical_datum (
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    name TEXT NOT NULL CHECK (length(name) >= 2),
    description TEXT,
    scope TEXT,
    area_of_use_auth_name TEXT NOT NULL,
    area_of_use_code TEXT NOT NULL,
    publication_date TEXT CHECK (NULL OR length(publication_date) = 10), --- YYYY-MM-DD format
    deprecated BOOLEAN NOT NULL CHECK (deprecated IN (0, 1)),
    CONSTRAINT pk_vertical_datum PRIMARY KEY (auth_name, code),
    CONSTRAINT fk_vertical_datum_area FOREIGN KEY (area_of_use_auth_name, area_of_use_code) REFERENCES area(auth_name, code)
);

CREATE TABLE coordinate_system(
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    type TEXT NOT NULL CHECK (type IN ('Cartesian', 'vertical', 'ellipsoidal', 'spherical')),
    dimension SMALLINT NOT NULL CHECK (dimension BETWEEN 1 AND 3),
    CONSTRAINT pk_coordinate_system PRIMARY KEY (auth_name, code),
    CONSTRAINT check_cs_vertical CHECK (type != 'vertical' OR dimension = 1),
    CONSTRAINT check_cs_cartesian CHECK (type != 'Cartesian' OR dimension IN (2,3)),
    CONSTRAINT check_cs_ellipsoidal CHECK (type != 'ellipsoidal' OR dimension IN (2,3))
);

CREATE TABLE axis(
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    name TEXT NOT NULL CHECK (length(name) >= 2),
    abbrev TEXT NOT NULL,
    orientation TEXT NOT NULL,
    coordinate_system_auth_name TEXT NOT NULL,
    coordinate_system_code TEXT NOT NULL,
    coordinate_system_order SMALLINT NOT NULL CHECK (coordinate_system_order BETWEEN 1 AND 3),
    uom_auth_name TEXT NOT NULL,
    uom_code TEXT NOT NULL,
    CONSTRAINT pk_axis PRIMARY KEY (auth_name, code),
    CONSTRAINT fk_axis_coordinate_system FOREIGN KEY (coordinate_system_auth_name, coordinate_system_code) REFERENCES coordinate_system(auth_name, code),
    CONSTRAINT fk_axis_unit_of_measure FOREIGN KEY (uom_auth_name, uom_code) REFERENCES unit_of_measure(auth_name, code)
);

CREATE TABLE geodetic_crs(
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    name TEXT NOT NULL CHECK (length(name) >= 2),
    description TEXT,
    scope TEXT,
    type TEXT NOT NULL CHECK (type IN ('geographic 2D', 'geographic 3D', 'geocentric')),
    coordinate_system_auth_name TEXT,
    coordinate_system_code TEXT,
    datum_auth_name TEXT,
    datum_code TEXT,
    area_of_use_auth_name TEXT,
    area_of_use_code TEXT,
    text_definition TEXT, -- PROJ string or WKT string. Use of this is discouraged as prone to definition ambiguities
    deprecated BOOLEAN NOT NULL CHECK (deprecated IN (0, 1)),
    CONSTRAINT pk_geodetic_crs PRIMARY KEY (auth_name, code),
    CONSTRAINT fk_geodetic_crs_coordinate_system FOREIGN KEY (coordinate_system_auth_name, coordinate_system_code) REFERENCES coordinate_system(auth_name, code),
    CONSTRAINT fk_geodetic_crs_datum FOREIGN KEY (datum_auth_name, datum_code) REFERENCES geodetic_datum(auth_name, code),
    CONSTRAINT fk_geodetic_crs_area FOREIGN KEY (area_of_use_auth_name, area_of_use_code) REFERENCES area(auth_name, code),
    CONSTRAINT check_geodetic_crs_cs CHECK (NOT ((coordinate_system_auth_name IS NULL OR coordinate_system_code IS NULL) AND text_definition IS NULL)),
    CONSTRAINT check_geodetic_crs_cs_bis CHECK (NOT ((NOT(coordinate_system_auth_name IS NULL OR coordinate_system_code IS NULL)) AND text_definition IS NOT NULL)),
    CONSTRAINT check_geodetic_crs_datum CHECK (NOT ((datum_auth_name IS NULL OR datum_code IS NULL) AND text_definition IS NULL)),
    CONSTRAINT check_geodetic_crs_datum_bis CHECK (NOT ((NOT(datum_auth_name IS NULL OR datum_code IS NULL)) AND text_definition IS NOT NULL)),
    CONSTRAINT check_geodetic_crs_area CHECK (NOT ((area_of_use_auth_name IS NULL OR area_of_use_code IS NULL) AND text_definition IS NULL))
);

CREATE TABLE vertical_crs(
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    name TEXT NOT NULL CHECK (length(name) >= 2),
    description TEXT,
    scope TEXT,
    coordinate_system_auth_name TEXT NOT NULL,
    coordinate_system_code TEXT NOT NULL,
    datum_auth_name TEXT NOT NULL,
    datum_code TEXT NOT NULL,
    area_of_use_auth_name TEXT NOT NULL,
    area_of_use_code TEXT NOT NULL,
    deprecated BOOLEAN NOT NULL CHECK (deprecated IN (0, 1)),
    CONSTRAINT pk_vertical_crs PRIMARY KEY (auth_name, code),
    CONSTRAINT fk_vertical_crs_coordinate_system FOREIGN KEY (coordinate_system_auth_name, coordinate_system_code) REFERENCES coordinate_system(auth_name, code),
    CONSTRAINT fk_vertical_crs_datum FOREIGN KEY (datum_auth_name, datum_code) REFERENCES vertical_datum(auth_name, code),
    CONSTRAINT fk_vertical_crs_area FOREIGN KEY (area_of_use_auth_name, area_of_use_code) REFERENCES area(auth_name, code)
);

CREATE TABLE conversion_method(
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    name TEXT NOT NULL CHECK (length(name) >= 2),

    CONSTRAINT pk_conversion_method PRIMARY KEY (auth_name, code)
);

CREATE TABLE conversion_param(
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    name TEXT NOT NULL CHECK (length(name) >= 2),

    CONSTRAINT pk_conversion_param PRIMARY KEY (auth_name, code)
);

CREATE TABLE conversion_table(
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    name TEXT NOT NULL CHECK (length(name) >= 2),

    description TEXT,
    scope TEXT,

    area_of_use_auth_name TEXT NOT NULL,
    area_of_use_code TEXT NOT NULL,

    method_auth_name TEXT CHECK (method_auth_name IS NULL OR length(method_auth_name) >= 1),
    method_code TEXT CHECK (method_code IS NULL OR length(method_code) >= 1),
    -- method_name TEXT,

    param1_auth_name TEXT,
    param1_code TEXT,
    -- param1_name TEXT,
    param1_value FLOAT,
    param1_uom_auth_name TEXT,
    param1_uom_code TEXT,

    param2_auth_name TEXT,
    param2_code TEXT,
    --param2_name TEXT,
    param2_value FLOAT,
    param2_uom_auth_name TEXT,
    param2_uom_code TEXT,

    param3_auth_name TEXT,
    param3_code TEXT,
    --param3_name TEXT,
    param3_value FLOAT,
    param3_uom_auth_name TEXT,
    param3_uom_code TEXT,

    param4_auth_name TEXT,
    param4_code TEXT,
    --param4_name TEXT,
    param4_value FLOAT,
    param4_uom_auth_name TEXT,
    param4_uom_code TEXT,

    param5_auth_name TEXT,
    param5_code TEXT,
    --param5_name TEXT,
    param5_value FLOAT,
    param5_uom_auth_name TEXT,
    param5_uom_code TEXT,

    param6_auth_name TEXT,
    param6_code TEXT,
    --param6_name TEXT,
    param6_value FLOAT,
    param6_uom_auth_name TEXT,
    param6_uom_code TEXT,

    param7_auth_name TEXT,
    param7_code TEXT,
    --param7_name TEXT,
    param7_value FLOAT,
    param7_uom_auth_name TEXT,
    param7_uom_code TEXT,

    deprecated BOOLEAN NOT NULL CHECK (deprecated IN (0, 1)),

    CONSTRAINT pk_conversion PRIMARY KEY (auth_name, code),
    CONSTRAINT fk_conversion_area FOREIGN KEY (area_of_use_auth_name, area_of_use_code) REFERENCES area(auth_name, code),
    CONSTRAINT fk_conversion_method FOREIGN KEY (method_auth_name, method_code) REFERENCES conversion_method(auth_name, code),
    --CONSTRAINT fk_conversion_coordinate_operation FOREIGN KEY (auth_name, code) REFERENCES coordinate_operation(auth_name, code),
    CONSTRAINT fk_conversion_param1_uom FOREIGN KEY (param1_uom_auth_name, param1_uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT fk_conversion_param2_uom FOREIGN KEY (param2_uom_auth_name, param2_uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT fk_conversion_param3_uom FOREIGN KEY (param3_uom_auth_name, param3_uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT fk_conversion_param4_uom FOREIGN KEY (param4_uom_auth_name, param4_uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT fk_conversion_param5_uom FOREIGN KEY (param5_uom_auth_name, param5_uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT fk_conversion_param6_uom FOREIGN KEY (param6_uom_auth_name, param6_uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT fk_conversion_param7_uom FOREIGN KEY (param7_uom_auth_name, param7_uom_code) REFERENCES unit_of_measure(auth_name, code)
);

CREATE TABLE projected_crs(
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    name TEXT NOT NULL CHECK (length(name) >= 2),
    description TEXT,
    scope TEXT,
    coordinate_system_auth_name TEXT,
    coordinate_system_code TEXT,
    geodetic_crs_auth_name TEXT,
    geodetic_crs_code TEXT,
    conversion_auth_name TEXT,
    conversion_code TEXT,
    area_of_use_auth_name TEXT,
    area_of_use_code TEXT,
    text_definition TEXT, -- PROJ string or WKT string. Use of this is discouraged as prone to definition ambiguities
    deprecated BOOLEAN NOT NULL CHECK (deprecated IN (0, 1)),
    CONSTRAINT pk_projected_crs PRIMARY KEY (auth_name, code),
    CONSTRAINT fk_projected_crs_coordinate_system FOREIGN KEY (coordinate_system_auth_name, coordinate_system_code) REFERENCES coordinate_system(auth_name, code),
    CONSTRAINT fk_projected_crs_geodetic_crs FOREIGN KEY (geodetic_crs_auth_name, geodetic_crs_code) REFERENCES geodetic_crs(auth_name, code),
    CONSTRAINT fk_projected_crs_conversion FOREIGN KEY (conversion_auth_name, conversion_code) REFERENCES conversion_table(auth_name, code),
    CONSTRAINT fk_projected_crs_area FOREIGN KEY (area_of_use_auth_name, area_of_use_code) REFERENCES area(auth_name, code),
    CONSTRAINT check_projected_crs_cs CHECK (NOT((coordinate_system_auth_name IS NULL OR coordinate_system_code IS NULL) AND text_definition IS NULL)),
    CONSTRAINT check_projected_crs_cs_bis CHECK (NOT((NOT(coordinate_system_auth_name IS NULL OR coordinate_system_code IS NULL)) AND text_definition IS NOT NULL)),
    CONSTRAINT check_projected_crs_geodetic_crs CHECK (NOT((geodetic_crs_auth_name IS NULL OR geodetic_crs_code IS NULL) AND text_definition IS NULL)),
    CONSTRAINT check_projected_crs_conversion CHECK (NOT((NOT(conversion_auth_name IS NULL OR conversion_code IS NULL)) AND text_definition IS NOT NULL)),
    CONSTRAINT check_projected_crs_area CHECK (NOT((area_of_use_auth_name IS NULL OR area_of_use_code IS NULL) AND text_definition IS NULL))
);

CREATE TABLE compound_crs(
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    name TEXT NOT NULL CHECK (length(name) >= 2),
    description TEXT,
    scope TEXT,
    horiz_crs_auth_name TEXT NOT NULL,
    horiz_crs_code TEXT NOT NULL,
    vertical_crs_auth_name TEXT NOT NULL,
    vertical_crs_code TEXT NOT NULL,
    area_of_use_auth_name TEXT NOT NULL,
    area_of_use_code TEXT NOT NULL,
    deprecated BOOLEAN NOT NULL CHECK (deprecated IN (0, 1)),
    CONSTRAINT pk_compound_crs PRIMARY KEY (auth_name, code),
    CONSTRAINT fk_compound_crs_vertical_crs FOREIGN KEY (vertical_crs_auth_name, vertical_crs_code) REFERENCES vertical_crs(auth_name, code),
    CONSTRAINT fk_compoundcrs_area FOREIGN KEY (area_of_use_auth_name, area_of_use_code) REFERENCES area(auth_name, code)
);

CREATE TABLE coordinate_operation_method(
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    name TEXT NOT NULL CHECK (length(name) >= 2),

    CONSTRAINT pk_coordinate_operation_method PRIMARY KEY (auth_name, code)
);

CREATE TABLE helmert_transformation_table(
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    name TEXT NOT NULL CHECK (length(name) >= 2),

    description TEXT,
    scope TEXT,

    method_auth_name TEXT NOT NULL CHECK (length(method_auth_name) >= 1),
    method_code TEXT NOT NULL CHECK (length(method_code) >= 1),
    --method_name NOT NULL CHECK (length(method_name) >= 2),

    source_crs_auth_name TEXT NOT NULL,
    source_crs_code TEXT NOT NULL,
    target_crs_auth_name TEXT NOT NULL,
    target_crs_code TEXT NOT NULL,

    area_of_use_auth_name TEXT NOT NULL,
    area_of_use_code TEXT NOT NULL,

    accuracy FLOAT CHECK (accuracy >= 0),

    tx FLOAT NOT NULL,
    ty FLOAT NOT NULL,
    tz FLOAT NOT NULL,
    translation_uom_auth_name TEXT NOT NULL,
    translation_uom_code TEXT NOT NULL,
    rx FLOAT,
    ry FLOAT,
    rz FLOAT,
    rotation_uom_auth_name TEXT,
    rotation_uom_code TEXT,
    scale_difference FLOAT,
    scale_difference_uom_auth_name TEXT,
    scale_difference_uom_code TEXT,
    rate_tx FLOAT,
    rate_ty FLOAT,
    rate_tz FLOAT,
    rate_translation_uom_auth_name TEXT,
    rate_translation_uom_code TEXT,
    rate_rx FLOAT,
    rate_ry FLOAT,
    rate_rz FLOAT,
    rate_rotation_uom_auth_name TEXT,
    rate_rotation_uom_code TEXT,
    rate_scale_difference FLOAT,
    rate_scale_difference_uom_auth_name TEXT,
    rate_scale_difference_uom_code TEXT,
    epoch FLOAT,
    epoch_uom_auth_name TEXT,
    epoch_uom_code TEXT,
    px FLOAT, -- Pivot / evaluation point for Molodensky-Badekas
    py FLOAT,
    pz FLOAT,
    pivot_uom_auth_name TEXT,
    pivot_uom_code TEXT,

    operation_version TEXT, -- normally mandatory in OGC Topic 2 but optional here

    deprecated BOOLEAN NOT NULL CHECK (deprecated IN (0, 1)),

    CONSTRAINT pk_helmert_transformation PRIMARY KEY (auth_name, code),
    CONSTRAINT fk_helmert_transformation_source_crs FOREIGN KEY (source_crs_auth_name, source_crs_code) REFERENCES geodetic_crs(auth_name, code),
    CONSTRAINT fk_helmert_transformation_target_crs FOREIGN KEY (target_crs_auth_name, target_crs_code) REFERENCES geodetic_crs(auth_name, code),
    CONSTRAINT fk_helmert_transformation_area FOREIGN KEY (area_of_use_auth_name, area_of_use_code) REFERENCES area(auth_name, code),
    CONSTRAINT fk_helmert_transformation_method FOREIGN KEY (method_auth_name, method_code) REFERENCES coordinate_operation_method(auth_name, code),
    --CONSTRAINT fk_helmert_transformation_coordinate_operation FOREIGN KEY (auth_name, code) REFERENCES coordinate_operation(auth_name, code),
    CONSTRAINT fk_helmert_translation_uom FOREIGN KEY (translation_uom_auth_name, translation_uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT fk_helmert_rotation_uom FOREIGN KEY (rotation_uom_auth_name, rotation_uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT fk_helmert_scale_difference_uom FOREIGN KEY (scale_difference_uom_auth_name, scale_difference_uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT fk_helmert_rate_translation_uom FOREIGN KEY (rate_translation_uom_auth_name, rate_translation_uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT fk_helmert_rate_rotation_uom FOREIGN KEY (rate_rotation_uom_auth_name, rate_rotation_uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT fk_helmert_rate_scale_difference_uom FOREIGN KEY (rate_scale_difference_uom_auth_name, rate_scale_difference_uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT fk_helmert_epoch_uom FOREIGN KEY (epoch_uom_auth_name, epoch_uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT fk_helmert_pivot_uom FOREIGN KEY (pivot_uom_auth_name, pivot_uom_code) REFERENCES unit_of_measure(auth_name, code)
);

CREATE TABLE grid_transformation(
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    name TEXT NOT NULL CHECK (length(name) >= 2),

    description TEXT,
    scope TEXT,

    method_auth_name TEXT NOT NULL CHECK (length(method_auth_name) >= 1),
    method_code TEXT NOT NULL CHECK (length(method_code) >= 1),
    method_name NOT NULL CHECK (length(method_name) >= 2),

    source_crs_auth_name TEXT NOT NULL,
    source_crs_code TEXT NOT NULL,
    target_crs_auth_name TEXT NOT NULL,
    target_crs_code TEXT NOT NULL,

    area_of_use_auth_name TEXT NOT NULL,
    area_of_use_code TEXT NOT NULL,

    accuracy FLOAT CHECK (accuracy >= 0),

    grid_param_auth_name TEXT NOT NULL,
    grid_param_code TEXT NOT NULL,
    grid_param_name TEXT NOT NULL,
    grid_name TEXT NOT NULL,

    grid2_param_auth_name TEXT,
    grid2_param_code TEXT,
    grid2_param_name TEXT,
    grid2_name TEXT,

    interpolation_crs_auth_name TEXT,
    interpolation_crs_code TEXT,

    operation_version TEXT, -- normally mandatory in OGC Topic 2 but optional here

    deprecated BOOLEAN NOT NULL CHECK (deprecated IN (0, 1)),

    CONSTRAINT pk_grid_transformation PRIMARY KEY (auth_name, code),
    --CONSTRAINT fk_grid_transformation_coordinate_operation FOREIGN KEY (auth_name, code) REFERENCES coordinate_operation(auth_name, code),
    --CONSTRAINT fk_grid_transformation_source_crs FOREIGN KEY (source_crs_auth_name, source_crs_code) REFERENCES crs(auth_name, code),
    --CONSTRAINT fk_grid_transformation_target_crs FOREIGN KEY (target_crs_auth_name, target_crs_code) REFERENCES crs(auth_name, code),
    CONSTRAINT fk_grid_transformation_interpolation_crs FOREIGN KEY (interpolation_crs_auth_name, interpolation_crs_code) REFERENCES geodetic_crs(auth_name, code),
    CONSTRAINT fk_grid_transformation_transformation_area FOREIGN KEY (area_of_use_auth_name, area_of_use_code) REFERENCES area(auth_name, code)
);

CREATE TABLE grid_packages(
    package_name TEXT NOT NULL NULL PRIMARY KEY,    -- package name that contains the file
    description TEXT,
    url TEXT,                                       -- optional URL where to download the PROJ grid
    direct_download BOOLEAN CHECK (direct_download IN (0, 1)), -- whether the URL can be used directly (if 0, authentication etc mightbe needed)
    open_license BOOLEAN CHECK (open_license IN (0, 1))
);

CREATE TABLE grid_alternatives(
    original_grid_name TEXT NOT NULL PRIMARY KEY,   -- original grid name (e.g. Und_min2.5x2.5_egm2008_isw=82_WGS84_TideFree.gz). For LOS/LAS format, the .las files
    proj_grid_name TEXT NOT NULL,                   -- PROJ grid name (e.g egm08_25.gtx)
    proj_grid_format TEXT NOT NULL,                 -- one of 'CTable2', 'NTv1', 'NTv2', 'GTX'
    proj_method TEXT NOT NULL,                      -- hgridshift, vgridshift or geoid_like
    inverse_direction BOOLEAN NOT NULL CHECK (inverse_direction IN (0, 1)), -- whether the PROJ grid direction is reversed w.r.t to the authority one (TRUE in that case)
    package_name TEXT,                              -- package name that contains the file
    url TEXT,                                       -- optional URL where to download the PROJ grid
    direct_download BOOLEAN CHECK (direct_download IN (0, 1)), -- whether the URL can be used directly (if 0, authentication etc might be needed)
    open_license BOOLEAN CHECK (open_license IN (0, 1)),
    directory TEXT,                                 -- optional directory where the file might be located

    CONSTRAINT fk_grid_alternatives_grid_packages FOREIGN KEY (package_name) REFERENCES grid_packages(package_name),
    CONSTRAINT check_grid_alternatives_grid_fromat CHECK (proj_grid_format IN ('CTable2', 'NTv1', 'NTv2', 'GTX')),
    CONSTRAINT check_grid_alternatives_proj_method CHECK (proj_method IN ('hgridshift', 'vgridshift', 'geoid_like')),
    CONSTRAINT check_grid_alternatives_not_hgridshift CHECK (NOT(proj_method != 'hgridshift' AND proj_grid_format IN ('CTable2', 'NTv1', 'NTv2'))),
    CONSTRAINT check_grid_alternatives_not_vgridshift CHECK (NOT(proj_method = 'hgridshift' AND proj_grid_format IN ('GTX'))),
    CONSTRAINT check_grid_alternatives_inverse_direction CHECK (NOT(proj_method = 'geoid_like' AND inverse_direction = 1)),
    CONSTRAINT check_grid_alternatives_package_name_url CHECK (NOT(package_name IS NOT NULL AND url IS NOT NULL)),
    CONSTRAINT check_grid_alternatives_direct_download_url CHECK (NOT(direct_download IS NULL AND url IS NOT NULL)),
    CONSTRAINT check_grid_alternatives_open_license_url CHECK (NOT(open_license IS NULL AND url IS NOT NULL))
);

CREATE TABLE other_transformation(
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    name TEXT NOT NULL CHECK (length(name) >= 2),

    description TEXT,
    scope TEXT,

    -- if method_auth_name = 'PROJ', method_code can be 'PROJString' for a
    -- PROJ string and then method_name is a PROJ string (typically a pipeline)
    -- if method_auth_name = 'PROJ', method_code can be 'WKT' for a
    -- PROJ string and then method_name is a WKT string (CoordinateOperation)
    method_auth_name TEXT NOT NULL CHECK (length(method_auth_name) >= 1),
    method_code TEXT NOT NULL CHECK (length(method_code) >= 1),
    method_name NOT NULL CHECK (length(method_name) >= 2),

    source_crs_auth_name TEXT NOT NULL,
    source_crs_code TEXT NOT NULL,
    target_crs_auth_name TEXT NOT NULL,
    target_crs_code TEXT NOT NULL,

    area_of_use_auth_name TEXT NOT NULL,
    area_of_use_code TEXT NOT NULL,

    accuracy FLOAT CHECK (accuracy >= 0),

    param1_auth_name TEXT,
    param1_code TEXT,
    param1_name TEXT,
    param1_value FLOAT,
    param1_uom_auth_name TEXT,
    param1_uom_code TEXT,

    param2_auth_name TEXT,
    param2_code TEXT,
    param2_name TEXT,
    param2_value FLOAT,
    param2_uom_auth_name TEXT,
    param2_uom_code TEXT,

    param3_auth_name TEXT,
    param3_code TEXT,
    param3_name TEXT,
    param3_value FLOAT,
    param3_uom_auth_name TEXT,
    param3_uom_code TEXT,

    param4_auth_name TEXT,
    param4_code TEXT,
    param4_name TEXT,
    param4_value FLOAT,
    param4_uom_auth_name TEXT,
    param4_uom_code TEXT,

    param5_auth_name TEXT,
    param5_code TEXT,
    param5_name TEXT,
    param5_value FLOAT,
    param5_uom_auth_name TEXT,
    param5_uom_code TEXT,

    param6_auth_name TEXT,
    param6_code TEXT,
    param6_name TEXT,
    param6_value FLOAT,
    param6_uom_auth_name TEXT,
    param6_uom_code TEXT,

    param7_auth_name TEXT,
    param7_code TEXT,
    param7_name TEXT,
    param7_value FLOAT,
    param7_uom_auth_name TEXT,
    param7_uom_code TEXT,

    operation_version TEXT, -- normally mandatory in OGC Topic 2 but optional here

    deprecated BOOLEAN NOT NULL CHECK (deprecated IN (0, 1)),

    CONSTRAINT pk_other_transformation PRIMARY KEY (auth_name, code),
    --CONSTRAINT fk_other_transformation_coordinate_operation FOREIGN KEY (auth_name, code) REFERENCES coordinate_operation(auth_name, code),
    --CONSTRAINT fk_other_transformation_source_crs FOREIGN1 KEY (source_crs_auth_name, source_crs_code) REFERENCES crs(auth_name, code),
    --CONSTRAINT fk_other_transformation_target_crs FOREIGN KEY (target_crs_auth_name, target_crs_code) REFERENCES crs(auth_name, code),
    CONSTRAINT fk_other_transformation_area FOREIGN KEY (area_of_use_auth_name, area_of_use_code) REFERENCES area(auth_name, code)
    CONSTRAINT fk_other_transformation_param1_uom FOREIGN KEY (param1_uom_auth_name, param1_uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT fk_other_transformation_param2_uom FOREIGN KEY (param2_uom_auth_name, param2_uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT fk_other_transformation_param3_uom FOREIGN KEY (param3_uom_auth_name, param3_uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT fk_other_transformation_param4_uom FOREIGN KEY (param4_uom_auth_name, param4_uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT fk_other_transformation_param5_uom FOREIGN KEY (param5_uom_auth_name, param5_uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT fk_other_transformation_param6_uom FOREIGN KEY (param6_uom_auth_name, param6_uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT fk_other_transformation_param7_uom FOREIGN KEY (param7_uom_auth_name, param7_uom_code) REFERENCES unit_of_measure(auth_name, code),
    CONSTRAINT check_other_transformation_method CHECK (NOT (method_auth_name = 'PROJ' AND method_code NOT IN ('PROJString', 'WKT')))
);

CREATE TABLE concatenated_operation(
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    name TEXT NOT NULL CHECK (length(name) >= 2),

    description TEXT,
    scope TEXT,

    source_crs_auth_name TEXT NOT NULL,
    source_crs_code TEXT NOT NULL,
    target_crs_auth_name TEXT NOT NULL,
    target_crs_code TEXT NOT NULL,

    area_of_use_auth_name TEXT NOT NULL,
    area_of_use_code TEXT NOT NULL,

    accuracy FLOAT CHECK (accuracy >= 0),

    operation_version TEXT, -- normally mandatory in OGC Topic 2 but optional here

    deprecated BOOLEAN NOT NULL CHECK (deprecated IN (0, 1)),

    CONSTRAINT pk_concatenated_operation PRIMARY KEY (auth_name, code),
    --CONSTRAINT fk_concatenated_operation_coordinate_operation FOREIGN KEY (auth_name, code) REFERENCES coordinate_operation(auth_name, code),
    --CONSTRAINT fk_concatenated_operation_source_crs FOREIGN KEY (source_crs_auth_name, source_crs_code) REFERENCES crs(auth_name, code),
    --CONSTRAINT fk_concatenated_operation_target_crs FOREIGN KEY (target_crs_auth_name, target_crs_code) REFERENCES crs(auth_name, code),
    CONSTRAINT fk_concatenated_operation_transformation_area FOREIGN KEY (area_of_use_auth_name, area_of_use_code) REFERENCES area(auth_name, code)
);

CREATE TABLE concatenated_operation_step(
    operation_auth_name TEXT NOT NULL CHECK (length(operation_auth_name) >= 1),
    operation_code TEXT NOT NULL CHECK (length(operation_code) >= 1),
    step_number INTEGER NOT NULL CHECK (step_number >= 1),
    step_auth_name TEXT NOT NULL CHECK (length(step_auth_name) >= 1),
    step_code TEXT NOT NULL CHECK (length(step_code) >= 1),

    CONSTRAINT pk_concatenated_operation_step PRIMARY KEY (operation_auth_name, operation_code, step_number)
    --CONSTRAINT fk_concatenated_operation_step_to_operation FOREIGN KEY (step_auth_name, step_code) REFERENCES coordinate_operation(auth_name, code)
);

CREATE TABLE geoid_model(
    name TEXT NOT NULL,
    operation_auth_name TEXT NOT NULL,
    operation_code TEXT NOT NULL,
    CONSTRAINT pk_geoid_model PRIMARY KEY (name, operation_auth_name, operation_code)
    -- CONSTRAINT fk_geoid_model_operation FOREIGN KEY (operation_auth_name, operation_code) REFERENCES coordinate_operation(auth_name, code)
);

CREATE TABLE alias_name(
    table_name TEXT NOT NULL CHECK (table_name IN (
        'unit_of_measure', 'celestial_body', 'ellipsoid', 
        'area', 'prime_meridian', 'geodetic_datum', 'vertical_datum', 'geodetic_crs',
        'projected_crs', 'vertical_crs', 'compound_crs', 'conversion', 'grid_transformation',
        'helmert_transformation', 'other_transformation', 'concatenated_operation')),
    auth_name TEXT NOT NULL CHECK (length(auth_name) >= 1),
    code TEXT NOT NULL CHECK (length(code) >= 1),
    alt_name TEXT NOT NULL CHECK (length(alt_name) >= 2),
    source TEXT
);

CREATE TABLE supersession(
    superseded_table_name TEXT NOT NULL CHECK (superseded_table_name IN (
        'unit_of_measure', 'celestial_body', 'ellipsoid', 
        'area', 'prime_meridian', 'geodetic_datum', 'vertical_datum', 'geodetic_crs',
        'projected_crs', 'vertical_crs', 'compound_crs', 'conversion', 'grid_transformation',
        'helmert_transformation', 'other_transformation', 'concatenated_operation')),
    superseded_auth_name TEXT NOT NULL,
    superseded_code TEXT NOT NULL,
    replacement_table_name TEXT NOT NULL CHECK (replacement_table_name IN (
        'unit_of_measure', 'celestial_body', 'ellipsoid', 
        'area', 'prime_meridian', 'geodetic_datum', 'vertical_datum', 'geodetic_crs',
        'projected_crs', 'vertical_crs', 'compound_crs', 'conversion', 'grid_transformation',
        'helmert_transformation', 'other_transformation', 'concatenated_operation')),
    replacement_auth_name TEXT NOT NULL,
    replacement_code TEXT NOT NULL,
    source TEXT
);

CREATE TABLE deprecation(
    table_name TEXT NOT NULL CHECK (table_name IN (
        'unit_of_measure', 'celestial_body', 'ellipsoid',
        'area', 'prime_meridian', 'geodetic_datum', 'vertical_datum', 'geodetic_crs',
        'projected_crs', 'vertical_crs', 'compound_crs', 'conversion', 'grid_transformation',
        'helmert_transformation', 'other_transformation', 'concatenated_operation')),
    deprecated_auth_name TEXT NOT NULL,
    deprecated_code TEXT NOT NULL,
    replacement_auth_name TEXT NOT NULL,
    replacement_code TEXT NOT NULL,
    source TEXT
);

CREATE TABLE authority_to_authority_preference(
    source_auth_name TEXT NOT NULL, -- 'any' for any source
    target_auth_name TEXT NOT NULL, -- 'any' for any target
    allowed_authorities TEXT NOT NULL,  -- for example 'PROJ,EPSG,any'
    CONSTRAINT unique_authority_to_authority_preference UNIQUE (source_auth_name, target_auth_name)
);

