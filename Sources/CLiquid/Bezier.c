//
//  Bezier.c
//  
//
//  Created by Michael Verges on 8/17/20.
//

#include "Bezier.h"

/**
 * @brief Finds Bezier control points from source points
 * @see https://github.com/maustinstar/liquid/blob/master/Docs/Liquid%20Implementation%20Guide.md#mathematics
 *
 * @param size number of points
 * @param src_x source x coordinates
 * @param src_y source y coordinates
 * @param ctrl1_x control1 x coordinates
 * @param ctrl1_y control1 y coordinates
 * @param ctrl2_x control2 x coordinates
 * @param ctrl2_y control2 y coordinates
 */
void bezier_ctrl(const int size, const double *src_x, const double *src_y,
                 double *ctrl1_x, double *ctrl1_y,
                 double *ctrl2_x, double *ctrl2_y) {
    int prev = size - 1;
    int next = 1;
    for(int i = 0; i < size; i++) {
        double dx = src_x[prev] - src_x[next];
        double dy = src_y[prev] - src_y[next];
        double m = sqrt(dx * dx + dy * dy);
        dx /= m;
        dy /= m;
        
        double next_dx = src_x[i] - src_x[next];
        double next_dy = src_y[i] - src_y[next];
        double next_dist = sqrt(next_dx * next_dx + next_dy * next_dy);
        ctrl1_x[next] = src_x[i] - dx * next_dist / 3.0;
        ctrl1_y[next] = src_y[i] - dy * next_dist / 3.0;
        
        double prev_dx = src_x[i] - src_x[prev];
        double prev_dy = src_y[i] - src_y[prev];
        double prev_dist = sqrt(prev_dx * prev_dx + prev_dy * prev_dy);
        ctrl2_x[i] = src_x[i] + dx * prev_dist / 3.0;
        ctrl2_y[i] = src_y[i] + dy * prev_dist / 3.0;
        
        prev = (prev + 1) % size;
        next = (next + 1) % size;
    }
}
