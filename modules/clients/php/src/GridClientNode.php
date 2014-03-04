#!/bin/php

<?php

/* @php.file.header */

/*  _________        _____ __________________        _____
 *  __  ____/___________(_)______  /__  ____/______ ____(_)_______
 *  _  / __  __  ___/__  / _  __  / _  / __  _  __ `/__  / __  __ \
 *  / /_/ /  _  /    _  /  / /_/ /  / /_/ /  / /_/ / _  /  _  / / /
 *  \____/   /_/     /_/   \_,__/   \____/   \__,_/  /_/   /_/ /_/
 */

/**
 * PHP client API.
 */
interface GridClientNode {
    /**
     * @abstract
     * @return string
     */
    public function id();

    /**
     * @abstract
     * @return array
     */
    public function internalAddresses();

    /**
     * @abstract
     * @return array
     */
    public function externalAddresses();

    /**
     * @abstract
     * @return int
     */
    public function port();

    /**
     * @abstract
     * @return array
     */
    public function attributes();

    /**
     * @abstract
     * @param string $name
     * @return mixed
     */
    public function attribute(string $name);

    /**
     * @abstract
     * @return array
     */
    public function metrics();
}

?>
