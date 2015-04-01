---
layout: post
title: "Python Package to RPM"
date: Thu Oct 23 18:10:34 PDT 2014
---

Sometimes you need to convert your Python package into an RPM (perhaps for
political reasons). If you are using `distutils`/`setuptools`, then this
is very easy after a bit of setup.

The exapmle that follows assumes a CentOS 6 box, but should work on any
Fedora-like distro.

##### Enable EPEL

```bash
$ wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
$ sudo rpm -ivh epel-release-6-8.noarch.rpm
```

##### Install dependencies

```bash
$ sudo yum groupinstall -y 'Development Tools'
$ sudo yum install -y fedora-packager git python-pip
```

##### Setup RPM build envirionment

```bash
$ sudo usermod -a -G mock <foo user>
$ rpmdev-setuptree
```

##### Create spec, build source tarball

```bash
$ python setup.py bdist_rpm --requires='mysql-connector-python,python-pip'
```

##### Modify spec as needed

As mentioned in the [docs](https://docs.python.org/2/distutils/builtdist.html#creating-rpm-packages),
"there are many options in .spec files that don't have corresponding options
in the setup script" so you may need to modify parts by hand. In my case,
there's currently no RPM for `sqlsoup`, so I need to install it during the
`post` step.

```spec
# foo.spec
%prep
%setup -n %{name}-%{unmangled_version} -n %{name}-%{unmangled_version}

%build
python setup.py build

%post
pip install sqlsoup
```

##### Build RPM

```bash
$ rpmbuild -ba ./foo.spec
```

##### Install RPM

Hopefully the `rpmbuild` command completed successfully and all that remains is
to install the RPM.

```bash
$ sudo rpm -ivh foo-0.1.0-1.noarch.rpm
```
