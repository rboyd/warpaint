# Warpaint
### Kismet + phone GPS = wardrive maps

Warpaint is a library and command-line utility for integrating GPS Exchange Format (GPX) files with Kismet logs (NetXML) to produce Google Earth (KML) output.

In plain english, warpaint allows you to run Kismet without a GPS receiver and retroactively apply timestamped coordinates from a GPX file to plot discovered access points on a map. Basically you can use your iPhone or Android instead of a GPS device.

Here's an example screenshot from Google Earth after importing a KML file built with warpaint:

<a target='_blank' title='Google Earth Thumbnail' href='http://yfrog.com/oep1up'><img src='http://a.yfrog.com/img878/2213/p1u.th.png' border='0'/></a>

## Dependencies

Warpaint depends on the schleyfox-ruby_kml gem which exists on GitHub and not Rubyforge. Assuming you have ruby and rubygems, install it like so:

```sh
gem install schleyfox-ruby_kml --source http://gems.github.com
```

## Installation

Warpaint is itself a gem. Install it with:

```sh
gem install warpaint
```

## Usage

First you will need [Kismet](http://kismetwireless.net/), the gold standard in war driving tools.

Next you will need an app or device that can log your trip in GPX format. I'm fond of [Stag](http://itunes.apple.com/us/app/stag-geotagging-gpx-export/id404545347?mt=8) for iPhone/iPad.


```
Usage: bin/warpaint <kismetfile.netxml> <coordinates.gpx> (options) [options: invoke with --help]
    -g, --gtime GPX_TIME_ADJUSTMENT  Adjust the timestamps in GPX file by seconds (can be negative)
    -n NETXML_TIME_ADJUSTMENT,       Adjust the timestamps in NetXML file by seconds (can be negative)
        --ntime
    -o, --out OUTPUT                 The output file (.KML) to write
    -h, --help                       Show this message
```

If you don't specify an output file warpaint will render the KML to STDOUT. Typical usage is just:

```sh
warpaint <kismetfile.netxml> <coordinates.gpx> -o <kmfile.kml>
```

This will write to a file in KML format which you can now import into [Google Earth](http://www.google.com/earth/index.html).

The time adjustment options are supplied in case your GPX logger and your Kismet device times were out of sync.

## Contribute

This project is hosted on [github](http://github.com/rboyd/warpaint). You should open an issue there to report any bugs or send a pull request with any cool new features you've added.

# Play nice

Check with your local law-enforcement agency and ethics professor before doing anything crazy. Whatever happens, don't blame [me](http://twitter.com/rboyd)!