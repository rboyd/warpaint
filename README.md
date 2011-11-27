# Warpaint
### Kismet + phone GPS = wardrive maps

Warpaint is a library and command-line utility for integrating GPS Exchange Format (GPX) files with Kismet logs (NetXML) to produce Google Earth (KML) output.

In plain english, warpaint allows you to run Kismet without a GPS receiver and retroactively apply timestamped coordinates from a GPX file to plot discovered access points on a map. Basically you can use your iPhone or Android instead of a GPS device.

## Installation

It's just a gem. Assuming you have ruby and rubygems installed:

```sh
gem install warpaint
```

## Usage

First you will need [Kismet](http://kismetwireless.net/), the gold standard in war driving tools.

Next you will need an app or device that can log your trip in GPX format. I'm fond of [Stag](http://itunes.apple.com/us/app/stag-geotagging-gpx-export/id404545347?mt=8) for iPhone/iPad.

Then just run:

```sh
warpaint <kismetfile.netxml> <coordinates.gpx> -o <kmfile.kml>
```

This will write to a file in KML format that you can now import into Google Earth.

## Contribute

This project is hosted on (github)[http://github.com/rboyd/warpaint]. You should open an issue there to report any bugs or send a pull request with any cool new features you've added.

# Play nice

Check with your local law-enforcement agency and ethics professor before doing anything crazy. Whatever happens, don't blame (me)[http://twitter.com/rboyd]!