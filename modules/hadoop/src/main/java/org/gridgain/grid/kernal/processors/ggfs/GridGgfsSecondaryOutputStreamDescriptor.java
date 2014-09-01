/* @java.file.header */

/*  _________        _____ __________________        _____
 *  __  ____/___________(_)______  /__  ____/______ ____(_)_______
 *  _  / __  __  ___/__  / _  __  / _  / __  _  __ `/__  / __  __ \
 *  / /_/ /  _  /    _  /  / /_/ /  / /_/ /  / /_/ / _  /  _  / / /
 *  \____/   /_/     /_/   \_,__/   \____/   \__,_/  /_/   /_/ /_/
 */

package org.gridgain.grid.kernal.processors.ggfs;

import org.gridgain.grid.*;
import org.gridgain.grid.ggfs.*;

/**
 * Descriptor of an output stream opened to the secondary file system.
 */
public class GridGgfsSecondaryOutputStreamDescriptor {
    /** Parent ID in the primary file system. */
    private final GridUuid parentId;

    /** File info in the primary file system. */
    private final GridGgfsFileInfo info;

    /** Writer of the secondary file system. */
    private final GridGgfsWriter writer;

    /**
     * Constructor.
     *
     * @param parentId Parent ID in the primary file system.
     * @param info File info in the primary file system.
     * @param writer Writer of the secondary file system.
     */
    GridGgfsSecondaryOutputStreamDescriptor(GridUuid parentId, GridGgfsFileInfo info, GridGgfsWriter writer) {
        assert parentId != null;
        assert info != null;
        assert writer != null;

        this.parentId = parentId;
        this.info = info;
        this.writer = writer;
    }

    /**
     * @return Parent ID in the primary file system.
     */
    GridUuid parentId() {
        return parentId;
    }

    /**
     * @return File info in the primary file system.
     */
    GridGgfsFileInfo info() {
        return info;
    }

    /**
     * @return Output stream to the secondary file system.
     */
    GridGgfsWriter out() {
        return writer;
    }
}
