# A Makefile for fusing Google Test and building a sample test against it.
#
# SYNOPSIS:
#
#   make [all]  - makes everything.
#   make TARGET - makes the given target.
#   make check  - makes everything and runs the built sample test.

# Points to the root of fused Google Test, relative to where this file is.
GTEST_DIR = /googletest/googletest

# Paths to the fused gtest files.
GTEST_H = $(GTEST_DIR)/include/gtest/gtest.h
GTEST_ALL_CC = $(GTEST_DIR)/src/gtest-all.cc

# Where to find the sample test.
SAMPLE_DIR = $(GTEST_DIR)/samples

# Where to find gtest_main.cc.
GTEST_MAIN_CC = $(GTEST_DIR)/src/gtest_main.cc

# Flags passed to the preprocessor.
# We have no idea here whether pthreads is available in the system, so
# disable its use.
CPPFLAGS += -I$(GTEST_DIR) -DGTEST_HAS_PTHREAD=0 -Wall

# Flags passed to the C++ compiler.
CXXFLAGS += -g

all : sample1_unittest

check : all
	./sample1_unittest

gtest-all.o : $(GTEST_H) $(GTEST_ALL_CC)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $(GTEST_ALL_CC)

gtest_main.o : $(GTEST_H) $(GTEST_MAIN_CC)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $(GTEST_MAIN_CC)

sample1.o : $(SAMPLE_DIR)/sample1.cc $(SAMPLE_DIR)/sample1.h
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $(SAMPLE_DIR)/sample1.cc

sample1_unittest.o : $(SAMPLE_DIR)/sample1_unittest.cc \
                     $(SAMPLE_DIR)/sample1.h $(GTEST_H)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $(SAMPLE_DIR)/sample1_unittest.cc

sample1_unittest : sample1.o sample1_unittest.o gtest-all.o gtest_main.o
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) $^ -o $@
