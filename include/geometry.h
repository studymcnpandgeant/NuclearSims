#ifndef _geometry3D
#define _geometry3D

#include "math.h"
#include "TMatrix.h"

using namespace std;

struct point3D
{
  double p0[3];
};

struct line3D
{
  double p0[3];
  double u[3];
  double t;
};

struct plane3D
{
  double p0[3];
  double n[3];
};



class geometry3D
{
 public:
  geometry3D();
  ~geometry3D();

int intersect(line3D, plane3D);




 private:

  





};


#endif
