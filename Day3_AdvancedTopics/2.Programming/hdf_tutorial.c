
/*
 *  This example illustrates how to create a dataset
 *  array.  It is used in the HDF5 Tutorial.
 */

#include <stdio.h>
#include <stdlib.h>
#include "hdf5.h"

#define H5FILE "dset.h5"
#define NX     100000                      /* dataset dimensions */
#define NY     3


int main() {

  FILE        *fp;
  hid_t       file_id, dataset_id, dataspace_id;  /* identifiers */
  hsize_t     dims[2];
  herr_t      status;
  double      data[NX][NY];          /* data to write */
  int         i, j;

  /*
   * Data  and output buffer initialization.
   */
  for (j = 0; j < NX; j++) {
    for (i = 0; i < NY; i++)
      data[j][i] = drand48();
  }

  /* Create a new file using default properties. */
  file_id = H5Fcreate(H5FILE, H5F_ACC_TRUNC, H5P_DEFAULT, H5P_DEFAULT);

  /* Create the data space for the dataset. */
  dims[0] = NX;
  dims[1] = NY;
  dataspace_id = H5Screate_simple(2, dims, NULL);

  /* Create the dataset. */
  dataset_id = H5Dcreate2(file_id, "/dset", H5T_NATIVE_DOUBLE, dataspace_id,
                          H5P_DEFAULT, H5P_DEFAULT, H5P_DEFAULT);

  /*
   * Write the data to the dataset using default transfer properties.
   */
  status = H5Dwrite(dataset_id, H5T_NATIVE_DOUBLE, H5S_ALL, H5S_ALL,
		    H5P_DEFAULT, data);

  /* End access to the dataset and release resources used by it. */
  status = H5Dclose(dataset_id);

  /* Terminate access to the data space. */
  status = H5Sclose(dataspace_id);

  /* Close the file. */
  status = H5Fclose(file_id);

  fp=fopen("dset.txt","w");
  for (j = 0; j < NX; j++) {
    for (i = 0; i < NY; i++)
      fprintf(fp, "%.16e ", data[j][i]);
    fprintf(fp, "\n");
  }
  fclose(fp);

}
