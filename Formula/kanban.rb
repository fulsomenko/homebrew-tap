class Kanban < Formula
  desc "Fast, keyboard-driven terminal kanban board"
  homepage "https://github.com/fulsomenko/kanban"
  url "https://github.com/kanban-rs/kanban/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "007d34300bf56bd215647f7cc5b9e024f9eee4fd853c074edf527fce4ff84bf7"
  license "Apache-2.0"
  head "https://github.com/fulsomenko/kanban.git", branch: "develop"

  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/kanban-cli")
    system "cargo", "install", *std_cargo_args(path: "crates/kanban-mcp")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kanban --version")
    system({ "KANBAN_FILE" => testpath/"test.json" }, bin/"kanban", "init", "--board", "BrewTest")
    assert_path_exists testpath/"test.json"
  end
end
