import argparse
import v8unpack

def main():
    parser = argparse.ArgumentParser(description='Unpack 1C source file using v8unpack.')
    parser.add_argument('source', help='Path to the .cf or .epf file')
    parser.add_argument('destination', help='Path to the folder where files will be unpacked')

    args = parser.parse_args()

    v8unpack.extract(args.source, args.destination)

if __name__ == '__main__':
    main()
