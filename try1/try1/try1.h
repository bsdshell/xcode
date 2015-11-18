/*
 *  try1.h
 *  try1
 *
 *  Created by cat on 9/28/15.
 *  Copyright (c) 2015 myxcode. All rights reserved.
 *
 */

extern "C" {
#include <CoreFoundation/CoreFoundation.h>

#pragma GCC visibility push(default)

/* External interface to the try1, C-based */

CFStringRef try1UUID(void);

#pragma GCC visibility pop
}
