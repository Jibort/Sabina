package base

import (
	"fmt"
	"strconv"
	"strings"
)

type Version struct {
	// Implementa 'Stringer'
	major int
	minor int
	bug   int
}

var nullVersion *Version = NewVersion(0, 0, 0)

func NullVersion() Version { return *nullVersion }

// Builders ===========================
func NewVersion(pMajor, pMinor, pBug int) *Version {
	return &Version{
		major: pMajor,
		minor: pMinor,
		bug:   pBug,
	}
}

func ParseVersion(pVersion string) (rVers *Version, rErr error) {
	var major, minor, bug int = 0, 0, 0
	var err error

	rVers = NewVersion(major, minor, bug)

	pVersion = strings.TrimSpace(pVersion)
	parts := strings.Split(pVersion, ".")
	if len(parts) < 1 || len(parts) > 3 {
		rErr = VersionParseError(pVersion)
		return
	}

	parts[0] = strings.TrimSpace(parts[0])
	major, err = strconv.Atoi(parts[0])
	if err != nil {
		rErr = err
		return
	}

	if len(parts) < 2 {
		rVers = NewVersion(major, minor, bug)
		return
	}

	parts[1] = strings.TrimSpace(parts[1])
	minor, err = strconv.Atoi(parts[1])
	if err != nil {
		rErr = err
		return
	}

	if len(parts) < 3 {
		rVers = NewVersion(major, minor, bug)
		return
	}

	parts[2] = strings.TrimSpace(parts[2])
	bug, err = strconv.Atoi(parts[2])
	if err != nil {
		rErr = err
		return
	}

	rVers = NewVersion(major, minor, bug)
	return
}

// Getters ============================
func (sVers Version) Major() int { return sVers.major }
func (sVers Version) Minor() int { return sVers.minor }
func (sVers Version) Bug() int   { return sVers.bug }

// Interficie 'Stringer' ==============
func (sVers Version) String() string {
	sb := strings.Builder{}

	return sb.String()
}

// Errors =============================
func VersionParseError(pStr string) error {
	return fmt.Errorf("la cadena '%s' no correspon a una versió", pStr)
}
