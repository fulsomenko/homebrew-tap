class Kanban < Formula
  desc "Fast, keyboard-driven terminal kanban board"
  homepage "https://github.com/fulsomenko/kanban"
  url "https://github.com/kanban-rs/kanban/archive/refs/tags/v0.12.2.tar.gz"
  sha256 "9a70944dc90a74cc31a12039368f89c33c30d3e7fbb9c320e6455b79ca8991f2"
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
