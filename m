Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5B0299876
	for <lists+linux-remoteproc@lfdr.de>; Mon, 26 Oct 2020 22:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729421AbgJZVCq (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 26 Oct 2020 17:02:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:57002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729404AbgJZVCp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 26 Oct 2020 17:02:45 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603746165;
        bh=Hv9b8NqnaV3Kmk/8ujoPQ4J1KJpXLBoBPZVcWsUuM4I=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=e3dZUFURuG8AWOjO/4sU7FfNxZBPSsZpIhIZ+37xgUSCMg4dgShc/Qdb1LWog7AB0
         X/ytT46QiF6n1dA9fUSYwTB3mtwoo6GNRweWZpC2chP0D1aU+eSYIsp4fdpfF7F1CO
         8GUaJeUXws6Kvzw44U1xyE1t2pnOBH/1Fr446rEo=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: hwlock: omap: Convert binding to YAML
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160374616550.2093.18256658566844754332.git-patchwork-notify@kernel.org>
Date:   Mon, 26 Oct 2020 21:02:45 +0000
References: <20200828041447.5900-1-s-anna@ti.com>
In-Reply-To: <20200828041447.5900-1-s-anna@ti.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Thu, 27 Aug 2020 23:14:47 -0500 you wrote:
> Convert the current OMAP hwspinlock binding from text format to YAML
> format/DT schema, and delete the legacy text binding file.
> 
> The new YAML binding conversion is a slightly updated version compared
> to the original. The legacy "ti,hwmods" property is now obsolete and
> is dropped altogether, and the K3 example is updated to showcase the
> actual dts node usage.
> 
> [...]

Here is the summary with links:
  - dt-bindings: hwlock: omap: Convert binding to YAML
    https://git.kernel.org/andersson/remoteproc/c/d8db9dc34871

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


