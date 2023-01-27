---
layout: post
title:  "Installing Tensorflow-Metal on Apple Silicon MacOS with Miniconda"
date:   2023-01-20 07:00:00 +0700
year: 2023
tags: python tensorflow
comments: true
featured: true
---

Tensorflow is one of the most popular open-source machine learning libraries available today, and it's no surprise that many developers and data scientists want to get their hands on it. Unfortunately, installing Tensorflow can sometimes be a bit tricky, especially on MacOS, speaking from experience 😔. In this post, I'm going to walk you through the process of installing Tensorflow on MacOS using Miniconda, a lightweight version of Anaconda. By the end of this post, you'll have Tensorflow up and running on your machine and be ready to start experimenting with it.

There might be some incorrectness in this post, because after all this is what works for me, so it might not be the same for you, but feel free to let me know by any mean if you have a question or wanna point out any errors!! This will also serves as a note space for me to refer back in case I will need to install it again because oh boy 😮‍💨

When it comes to running Tensorflow on MacOS, one of the most important things to consider is the use of Apple's Metal framework. Metal is a low-level, low-overhead hardware-accelerated graphics and compute framework that is designed to make the most of the GPU capabilities of MacOS.

Using Metal with Tensorflow can provide a significant boost in performance, especially when working with large datasets or complex models. To take advantage of Metal when running Tensorflow on MacOS, you'll need to ensure that your system meets the minimum requirements and that you have the latest version of MacOS and Xcode installed.

## Requirements

- Mac computers with Apple silicon or AMD GPUs
- macOS 12.0 or later
- Python 3.8 or later
- Xcode command-line tools: xcode-select --install

## Get started

### 1. Set up conda environment

Miniconda is a lightweight version of the popular Anaconda distribution of Python. It is designed to provide a minimalistic version of the conda package manager and environment management system, making it an ideal option for developers and data scientists who want to have a small and efficient distribution without the bulk of the full Anaconda distribution.

#### Install Miniconda

Miniconda is a fantastic option for installing TensorFlow with GPU support. It creates a separate environment for TensorFlow, so you don't have to worry about any changes to your existing software. Plus, it's the easiest way to get everything set up, especially when it comes to configuring a GPU!!

```bash
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -o Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-latest-MacOSX-x86_64.sh
```

#### Create conda environment

Create a new conda environment named "my-conda" with the following

```bash
conda create --name tf python=3.9
```

And then activate the environment using

```bash
conda activate tf
```

In case you need to deactivate your environment, use the following command

```bash
conda deactivate
```

But the rest of the steps in this post will required you to activate the environment!

### 2. Install tensorflow-deps

First, force upgrade tensorflow-deps, but omit `-n my_env` if you dont need to point to any specific environment

```bash
conda install -c apple tensorflow-deps --force-reinstall -n my_env
```

### 3. Install base TensorFlow and tensorflow-metal plug-in

Install tensorflow using

```bash
python -m pip install tensorflow-macos
```

Then install tensorflow-metal plug in using

```bash
python -m pip install tensorflow-metal
```

#### Releases and versions

I came across an error when I was going to train my model, and I solved it by reverting back both tensorflow and metal to an earlier version

```bash
python -m pip install tensorflow-macos==2.9
python -m pip install tensorflow-metal==0.5.0
```

### 4. Verify the package

```bash
python -m pip list | grep tensorflow
```

Once Tensorflow is installed, you can check that Metal is being used by running the following code snippet:

```python
import tensorflow as tf

cifar = tf.keras.datasets.cifar100
(x_train, y_train), (x_test, y_test) = cifar.load_data()
model = tf.keras.applications.ResNet50(
    include_top=True,
    weights=None,
    input_shape=(32, 32, 3),
    classes=100,)

loss_fn = tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True)
model.compile(optimizer="adam", loss=loss_fn, metrics=["accuracy"])
model.fit(x_train, y_train, epochs=5, batch_size=64)
```

If Metal is being used, the script will run fine.

It's worth noting that while using Metal can greatly improve Tensorflow performance on MacOS, it may not always be the best option. If you're experiencing issues or are running into compatibility problems, you may want to consider using a different version of Tensorflow or a different deep learning library altogether

### 5. Note on installing and uninstalling

```bash
# uninstall existing tensorflow-macos and tensorflow-metal
python -m pip uninstall tensorflow-macos
python -m pip uninstall tensorflow-metal

# install the latest
python -m pip install tensorflow-macos
python -m pip install tensorflow-metal

# or install specify versions
python -m pip install tensorflow-macos==x.xx
python -m pip install tensorflow-metal==x.xx

# verify
python -m pip list | grep tensorflow
```

### Conclusion

In this blog post, I've covered the process of installing Tensorflow on MacOS using Miniconda and Metal. By now, you should have a good understanding of how to set up Tensorflow with Metal support on your MacOS machine and how to test that it is properly configured.

Installing Tensorflow with Metal support on MacOS can be a bit tricky, but by following the steps outlined in this post, you should be able to get it up and running in no time. And with the power of Metal, you can expect a significant boost in performance when working with large datasets or complex models.

I hope this post has been helpful to you, and that you are now ready to start experimenting with Tensorflow and all of its capabilities. Remember that Tensorflow is a powerful tool that can be used for a wide range of tasks, from image recognition and natural language processing to machine learning and deep learning.

If you have any questions or comments about this post, or if you run into any issues during the installation process, please feel free to reach out. I'm here to help and want to make sure that you are able to get the most out of Tensorflow and Metal on your MacOS machine.
