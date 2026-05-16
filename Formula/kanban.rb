class Kanban < Formula
  desc "Fast, keyboard-driven terminal kanban board"
  homepage "https://github.com/fulsomenko/kanban"
  url "https://github.com/fulsomenko/kanban/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "4285eaaa9220c87aead5339c6fe9df37fe39dd0956296e5506d7a0d6e110edef"
  license "Apache-2.0"
  head "https://github.com/fulsomenko/kanban.git", branch: "develop"

  depends_on "rust" => :build
  depends_on "pkg-config" => :build

  on_linux do
    depends_on "wayland"
    depends_on "libxcb"
  end

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/kanban-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kanban --version")
  end
end
